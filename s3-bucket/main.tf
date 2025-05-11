module "s3_bucket" {
    source = "terraform-aws-modules/s3-bucket/aws"
    bucket        = "my-unique-bucket-name-1234556789"
    acl           = "private"
    force_destroy = true
    attach_public_policy = false
    attach_policy = true

       server_side_encryption_configuration = {
        rule = {
            apply_server_side_encryption_by_default = {
                sse_algorithm     = "aws:kms"
                kms_master_key_id = "arn:aws:kms:ap-south-1:061051247919:key/ca83df62-ad47-42cf-b53a-ac4fb4ad23d4"
            }
            bucket_key_enabled = true
        }
    }
 versioning = {
    enabled = true
  }
    # You can define access points outside of the module if needed.
    # Ensure you use the correct bucket name from the module output.
    # resource "aws_s3_access_point" "example" {
    #     bucket = module.s3_bucket.s3_bucket_arn
    #     name   = "my-access-point"
    
    #     policy = jsonencode({
    #         "Version" = "2012-10-17"
    #         "Statement" = [
    #             {
    #                 "Sid" = "AllowAccessFromSpecificVpc"
    #                 "Effect" = "Allow"
    #                 "Principal" = "*"
    #                 "Action" = "s3:GetObject"
    #                 "Resource" = "arn:aws:s3:us-east-1:061051247919:accesspoint/my-access-point/*"
    #                 "Condition" = {
    #                     "StringEquals" = {
    #                         "aws:sourceVpce" = "vpc-0a95db94dcbda312c"
    #                     }
    #                 }
    #             }
    #         ]
    #     })
    # }

    # policy = jsonencode({
    #     "Version" = "2012-10-17"
    #     "Id" = "TerraformManagedS3BucketPolicy"
    #     "Statement" = [
    #         {
    #             "Sid" = "DenyInsecureTransport"
    #             "Effect" = "Deny"
    #             "Principal" = "*"
    #             "Action" = "*"
    #             "Resource" = "my-unique-bucket-name-1234556789/*"
            
    #             "Condition" = {
    #                 "Bool" = {
    #                     "aws:SecureTransport" = "false"
    #                 }
    #             }
    #         },
            # {
            #     "Sid" = "DenyNonVpcIamUsersRequest"
            #     "Effect" = "Deny"
            #     "Principal" = "*"
            #     "Action" = "*"
            #     "Resource" = [
            #          "arn:aws:s3:::my-unique-bucket-name-1234556789",
            #          "arn:aws:s3:::my-unique-bucket-name-1234556789/*"
            #     ]
            #     "Condition" = {
            #         "StringNotEquals" = {
            #             "aws:sourceVpce" = "vpce-1234567890abcdef0" # we can add wild cards here to allow multiple VPC endpoints
            #         }
            #         "ArnLike" = {
            #             "aws:PrincipalArn" = "arn:aws:iam::061051247919:user/adam" ## we can add wild cards here to allow multiple VPC endpoints
            #         }
            #     }
            # },
            # {
            #     "Sid":"PreventBucketAdministrationFromNonTerraformOrAdminUser"
            #     "Effect":"Deny"
            #     "Principal": "*"
            #     "Action": [
            #         "s3:PutBucketPolicy",
            #         "s3:PutBucketAcl",
            #         "s3:PutBucketCors",
            #         "s3:PutBucketLogging",
            #         "s3:PutBucketNotification",
            #         "s3:PutBucketReplication",
            #         "s3:PutBucketTagging",
            #         "s3:PutBucketVersioning",
            #         "s3:PutEncryptionConfiguration",
            #         "s3:PutLifecycleConfiguration",
            #         "s3:PutMetricsConfiguration",
            #         "s3:PutObjectRetention",
            #         "s3:PutObjectLegalHold"
            #     ],
            #     "Resource": [
            #         "arn:aws:s3:::my-unique-bucket-name-12345",
            #         "arn:aws:s3:::my-unique-bucket-name-12345/*"
            #     ],
            #     "Condition": {
            #         "AreNotLike": {
            #             "aws:PrincipalArn": [
            #                 "arn:aws:iam::061051247919:user/adam",
            #                 "arn:aws:iam::061051247919:user/bob"
            #             ]
            #         }
            #     }
            # },
            # {
            #     "Sid": "DenyNonAccessPointBucketAccess"
            #     "Effect": "Deny"
            #     "Principal": "*"
            #     "Action": "s3:object*",
            #     "Resource": [
            #         "arn:aws:s3:us-east-1:061051247919:accesspoint/my-access-point",
            #         "arn:aws:s3:us-east-1:061051247919:accesspoint/my-access-point/*"
            #     ],
            #     "Condition": {
            #         "StringNotEquals": {
            #             "s3:DataAccessPointArn": [
            #                 "arn:aws:s3:us-east-1:061051247919:accesspoint/my-access-point",
            #                 "arn:aws:s3:us-east-1:061051247919:accesspoint/my-access-point/*"
            #             ]
            #         }
            #     },
            #     "AreNotLike": {
            #         "aws:PrincipalArn": [
            #             "arn:aws:iam::061051247919:user/adam",
            #             "arn:aws:iam::061051247919:user/bob"
            #         ]
            #     }
            # }
    #     ]
    # })

    
 

}