
// Resources
resource "aws_cognito_user_pool" "user_pool" {
  name = "litemed-user-pool"

  username_attributes = ["email"]
  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length = 6
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_subject = "Account Confirmation"
    email_message = "Your confirmation code is {####}"
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      min_length = 1
      max_length = 256
    }
  }


  

}

resource "aws_cognito_user_pool_client" "client" {
  name = "litemed-web"

   user_pool_id = aws_cognito_user_pool.user_pool.id
   supported_identity_providers         = ["COGNITO"]
   allowed_oauth_flows_user_pool_client = true
   allowed_oauth_flows                  = ["code",]
   allowed_oauth_scopes                 = ["email", "openid", "phone", "profile", "aws.cognito.signin.user.admin"]

    callback_urls          = [
        "https://localhost:3000/",
    "https://${aws_cloudfront_distribution.s3_distribution.domain_name}/"
  ]
  
   logout_urls          = [
        "https://localhost:3000/",
    "https://${aws_cloudfront_distribution.s3_distribution.domain_name}/"
  ]
   
}
  

resource "aws_cognito_user_pool_domain" "cognito-domain" {
  domain       = "litemed-project"
  user_pool_id = "${aws_cognito_user_pool.user_pool.id}"
}


