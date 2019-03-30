# graphql-ruby-sample

## GraphQL

`POST http://127.0.0.1:3003/graphql`

## Subscriptions

`http://127.0.0.1:3003/cable`

### Queries

#### Query

```graphql
query {
  hello
}
```

### Expected response:

```json
{
  "data": {
    "hello": "World"
  }
}
```

### Mutations

#### Query

```graphql
mutation {
  createStatus {
    id
  }
}
```

#### Expected response:

```json
{
  "data": {
    "createStatus": {
      "id": "..."
    }
  }
}
```

#### Query

```graphql
mutation {
  updateStatus(id: "...") {
    success
  }
}
```

#### Expected response:

```json
{
  "data": {
    "updateStatus": {
      "success": true
    }
  }
}
```

### Mutations

#### Query

```graphql
subscription {
  statusChanged(id: "..") {
    status
  }
}
```

#### Expected response on subscribe:

**NB:** Not really sure of this payload, couldn't test it

```json
{
  "data": {
    "statusChanged": {
      "status": "You are subscribed to ..."
    }
  }
}
```

#### Expected response on trigger:

**NB:** Not really sure of this payload, couldn't test it

```json
{
  "data": {
    "statusChanged": {
      "status": "New status ..."
    }
  }
}
```
