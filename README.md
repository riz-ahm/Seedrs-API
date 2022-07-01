# README

This is a small project which implements two apis.
* Campaigns api (GET)
* Investment api (POST)

The procedures to use these apis are described below with detailed explanation.

## How to run the project

### Docker
To run the project simply run `docker-compose up`. And you are good to go!

## How to use the project

To use the campaigns and investment APIs you would need the `Postman` tool
or a similar tool that does the same job.
After running the project open up `Postman` and configure the requests to 
use the APIs

### Campaigns API
In `Postman` create a new GET request with the url `localhost:3000/campaigns`.

This API has pagination and filtering abilities. Below all the optional params are explained.

```http
GET localhost:3000/campaigns
```

| Parameter                 | Type               | Description                                                                                                     |
|:--------------------------|:-------------------|:----------------------------------------------------------------------------------------------------------------|
| `page`                    | `string`           | page number. eg: 1,2,3                                                                                          |
| `per_page`                | `string`           | number of records to show in a single page                                                                      |
| `sectors`                 | `array of strings` | Sectors to filter by. eg: ['food', 'home']                                                                      |
| `countries`               | `array of strings` | Countries to filter by. eg: ['UK']                                                                              |
| `percentage_raised_min`   | `decimal`          | lower limit of percentage raised to filter to filter by.                                                        |
| `percentage_raised_max`   | `decimal`          | upper limit of percentage raised to filter. **Filter will be applied if both params are sent**                  |
| `target_amount_min`       | `decimal`          | lower limit of target amount to filter to filter by.                                                            |
| `target_amount_max`       | `decimal`          | upper limit of target amount to filter. **Filter will be applied if both params are sent**                      |
| `investment_multiple_min` | `decimal`          | lower limit of investment multiple to filter to filter by.                                                      |
| `investment_multiple_max` | `decimal`          | upper limit of investment multiple to filter. **Filter will be applied if both params are sent**                |
| `amount_raised_min`       | `decimal`          | the minimum number of amount raised to filter by. Will return campaigns that have equal or more amounts raised. |
| `investor_count_min`      | `integer`          | the minimum number of investor count to filter by. Will return campaigns that have equal or more investors.     |

### Investment API
In `Postman` create a new POST request with the url `localhost:3000/investments`.

This API has validation implemented. If params validations are not met, it will return
meaningful errors

```http
POST localhost:3000/investments
```

In `Postman` just input the body as below with your desired values. 

**You need to know the campaign id in order to make the investment**

You can use the campaign api to get the desired campaigns `id`which will be the
`campaign_id` in the body of this post request.

**Body**

```json
{
    "investment": {
        "amount": 20.00,
        "investor_name": "John Doe",
        "campaign_id": 51
    }
}
```