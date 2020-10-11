# Pager
This Mule application was written for Mule 4 as a prototype for beginning to use HATEOAS and the need for pagination of mass collection responses with API returns. A list of 243 countries (JSON Array) is used to set the payload initially for the GET method endpoint `http://localhost:8081/api/v1/countries`. This defines the unpaginated payload as might be returned with any API application returning a collection of JSON objects. This application provides a reference implementation for more reasonable/manageable responses by dividing up the objects in the JSON array and paginating the output according to user need. By using the query parameters `page and perPage`, the user can tailor the server responses to better meet his needs and ability to consume the data given.

The key API resource is the GET request for the JSON array of countries. The query parameters are both required by the RAML specification:

```
title:       Pagination Prototype
description: API returns 243 country records (paged)
baseUri:     http://${app.host}:${app.port}/api/v1/countries

mediaType: application/json
version: v1

/health:
  description: Dead simple health check
  get:
    responses:
      200:
        body:
          application/json:
            example: !include examples/success-health.json

/:
  get:
    description: List of countries #http://localhost:8081/api/v1/countries?page=1&pageCount=20
    queryParameters:
      page:
        example: 1
        type: number
        format: int
        required: true
      perPage:
        example: 20
        type: number
        format: int
        required: true
    responses:
      200:
        body:
          application/json:
            example: !include examples/countries.json
```

### Running Locally
The Pager application can be run in Studio 7 using the Mule 4.3.x runtime. Follow these steps to run this prototype application:

1. Clone the application to your machine `git clone https://github.com/dlwhitehurst/pager.git`
2. Import the project into Anypoint Studio 7
3. Select the project in the Package Explorer
4. Right mouse, select *Run As/Mule Application (configure)* 
5. Verify configuration, select *Run*

That's it!

### Testing
Testing is easily achieved using `PostmanCollection.json` found at `src/test/resources`. The collection file (.json) can be imported into Postman and the requests contained within the collection can be used to fully experience the use of a common paginated payload transformation. While this application provides a solid implementation example, one can readily see how this could be isolated into a set of common flows to be used in a global dependency that all APIs could leverage.