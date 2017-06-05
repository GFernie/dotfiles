function awsmfa {
  aws_vars=$(
    aws-temp-token.sh $AWS_PROFILE_NAME $AWS_MFA_ARN $1 | \
    grep '^export'
  )
  eval $aws_vars
}

function awsprod {
  prod_json=$(
    aws sts assume-role \
    --role-arn $AWS_PROD_ROLE_ARN \
    --role-session-name prod
  )
  export_json=$(
    echo $prod_json | jq '.Credentials | {
      AWS_SECRET_ACCESS_KEY: .SecretAccessKey,
      AWS_ACCESS_KEY_ID: .AccessKeyId,
      AWS_SESSION_TOKEN: .SessionToken
    }'
  )
  eval $(
    echo $export_json | \
    jq -r 'to_entries | .[] | "export \(.key)=\(.value)"'
  )
}
