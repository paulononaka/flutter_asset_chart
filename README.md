# FlutFire

A sample project showing how to create a chart from a Rest API

- Flutter 2.10.3

State Management
- Flutter Bloc

Network layer
- Dio
- Json Serializable
- Json Annotation

Dependecy Injection
- Injectable
- Get_it

Syntax Suggar
- Freezed

Extras
- Fl Chart
- Flutter Svg
# App
### Setup

```bash
make install
```

### Running

```bash
make run
```

### Build

```bash
make build-android
make build-ios
```
#### API Endpoint
- Fetch User data API endpoint. This API is passed a `user_id` (string) and returns a JSON array of the list of holdings for that user.
#### Endpoints
- User portfolio holdings endpoint (UserID ranges from 1-20)
    - GET request
    - URL `https://624760d3229b222a3fcc6155.mockapi.io/api/v1/portfolio/[user_id]`
    - E.g., `https://624760d3229b222a3fcc6155.mockapi.io/api/v1/portfolio/2`
    - Query Params
        - `user_id`: `str`
    - Response
        - Return a list of the user's holdings in descending order by value.
        - Example response:
        ```
         [
            {
                "ticker": "AAPL",
                "name": "Apple",
                "type": "stock",
                "value": 1000,
            },
            ...
         ]
        ```