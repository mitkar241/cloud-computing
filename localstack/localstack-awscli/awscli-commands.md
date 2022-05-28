## AWS-CLI Commands
---

[aws-cli documentation](https://docs.aws.amazon.com/cli/latest/index.html)
- go to AWS service intended, e.g. `dynamodb`
- go to the action intended, e.g. `list-tables`
- check the `Synopsis`.

Some custom scripts are provided under folder [aws-services](/aws-services/)

Supported AWS services for now are-
- [IAM](/aws-services/iam/)
- [DynamoDB](/aws-services/dynamodb/)
- [Lambda](/aws-services/lambda/)

## Bash Scripts
---

### dynamodb scripts
---
go to folder [dynamodb](/aws-services/dynamodb/)

#### list dynamodb tables

```bash
bash list-tables.sh
```

#### get entries in dynamodb tables

```bash
bash scan-table.sh MOVIE
```

#### get schema of a dynamodb table

```bash
bash describe-table.sh MOVIE
```

### lambda scripts
---
go to folder [lambda](/aws-services/lambda/)

#### get list of lamda functions

```bash
bash list-functions.sh
```

*`NOTE`: make sure the environment variables are set.*
