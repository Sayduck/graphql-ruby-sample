# graphql-ruby-sample

## Get started:

1. Install locally

   ```bash
   $ git clone https://github.com/Sayduck/graphql-ruby-sample
   $ cd graphql-ruby-sample
   $ bundle install
   ```

1. Start server

   ```bash
   $ rails s
   ```

1. Go to `http://127.0.0.1:3003

   - You should see `{"hello":"world"}`

1. Try in GraphiQL `POST http://127.0.0.1:3003/graphql`

1. Try subscriptions at `http://127.0.0.1:3003/cable`

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
