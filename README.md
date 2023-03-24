# Super Heroes
This is a RESTful API for managing superheroes built with Ruby on Rails. It features three models: Hero, Power, and HeroPower. The Hero model has a name and a super_name, while the Power model has a name and a description. The HeroPower model serves as a join table between Hero and Power, and has a strength attribute.

## live link
   - [live link](https://pizza-shop-es0c.onrender.com)

## Topics
- Models
- Associations
- Validations
- Routes, Controllers, and REST

## Instructions

## Installation
To get started, clone the repository and navigate to the project directory:


    git clone https://github.com/abdishukri-105/Super-Heroes

cd pizza-shop

Then, install the required dependencies using Bundler:

    bundle install

 run the migrations:


    
    rails db:migrate
## Usage
Start the server with:


    rails server


## Table

#### heroes Table
| Column | Type   |
| ------ | ------ |
| name   | String |
| super_name   | String |
#### powers Table
| Column | Type    |
| ------ | ------- |
| name   | String  |
|description| String |
#### hero_powers Table
| Column | Type    |
| ------ | ------- |
| hero_id|integer |
| strength  | string |
|power_id|integer|


### Validations
 `HeroPower` model:

- `strength` must be one of the following values: 'Strong', 'Weak', 'Average'

 `Power` model:

- `description` must be present and at least 20 characters long

### Routes

`GET /heroes`

Response
```
[
  {
    "id": 1,
    "name": "Clark Kent",
    "super_name": "Superman"
  },
  {
    "id": 2,
    "name": "Bruce Wayne",
    "super_name": "Batman"
  },
  {
    "id": 3,
    "name": "Peter Parker",
    "super_name": "Spiderman"
  }
]
```
`GET /restaurants/:id`

If the `hero` exists, returns
```
{
  "id": 2,
  "name": "Bruce Wayne",
  "super_name": "Batman",
  "powers": [
    {
      "id": 1,
      "name": "Super Strength",
      "description": "Ability to lift heavy objects with ease"
    },
    {
      "id": 4,
      "name": "Web-slinging",
      "description": "Ability to shoot webs and swing through the city"
    },
    {
      "id": 3,
      "name": "Super Speed",
      "description": "Ability to move at superhuman speeds"
    }
  ]
}
```
If the `hero` does not exist, returns the following JSON data
```
{
  "error": "Hero not found"
}
```


`GET /powers`
Returns
```
[
  {
    "id": 1,
    "name": "Super Strength",
    "description": "Ability to lift heavy objects with ease"
  },
  {
    "id": 2,
    "name": "Flight",
    "description": "Ability to fly very high"
  },
  {
    "id": 3,
    "name": "Super Speed",
    "description": "Ability to move at superhuman speeds"
  },
  {
    "id": 4,
    "name": "Web-slinging",
    "description": "Ability to shoot webs and swing through the city"
  }
]
```

`GET /powers/:id` returns

```
{
  "id": 2,
  "name": "Flight",
  "description": "Ability to fly very high"
}
```

If the `Power` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```
{
  "error": "Power not found"
}
```

 `PATCH /powers/:id`

This route  updates an existing `Power`. It  accepts an object with
the following properties in the body of the request:

```
{
  "description": "Updated description"
}
```

If the `Power` exists and is updated successfully (passes validations), update
its description and return JSON data in the format below:

```
{
  "id": 1,
  "name": "super strength",
  "description": "Updated description"
}
```

If the `Power` does not exist, it returns the following JSON data, along with
the appropriate HTTP status code:

```
{
  "error": "Power not found"
}
```

If the `Power` is **not** updated successfully (does not pass validations),
return the following JSON data, along with the appropriate HTTP status code:

```
{
  "errors": ["validation errors"]
}
```

 `POST /hero_powers`

This route  creates a new `HeroPower` that is associated with an
existing `Power` and `Hero`. It  accepts an object with the following
properties in the body of the request:

```
{
  "strength": "Average",
  "power_id": 1,
  "hero_id": 3
}
```

If the `HeroPower` is created successfully, sends back a response with the data
related to the `Hero`:

```
{
  "id": 1,
  "name": "Kamala Khan",
  "super_name": "Ms. Marvel",
  "powers": [
    {
      "id": 1,
      "name": "super strength",
      "description": "gives the wielder super-human strengths"
    },
    {
      "id": 2,
      "name": "flight",
      "description": "gives the wielder the ability to fly through the skies at supersonic speed"
    }
  ]
}
```

If the `HeroPower` is **not** created successfully, return the following
JSON data, along with the appropriate HTTP status code:

```
{
  "errors": ["validation errors"]
}
```

## LICENSE
This repository is distributed under the ISC License
## Author
This repository is maintained by:
- Abdishukri Mohamed