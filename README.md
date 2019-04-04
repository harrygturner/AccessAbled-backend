## :blue_heart:   AccessAbled   :wheelchair:
AccessAbled makes London accessible to all members of society. It is like Tripadvisor but focuses on what people with disabilities look for when deciding to visit a London attraction. Frontend written in React.js with vanilla CSS, no styling packages were imported, and backend written in Ruby on Rails. Cloudinary was used to upload images and store them. Google Maps API was used to display attraction locations and tube stations. Data Scraping along with an XML file provided by TFL (Transport For London) was used to extract information about the accessibility of every tube stop in London and London attractions. This data was then used to create AccessAbled’s unique database.

## Motivation
During one of my projects at University I was lucky enough to work with the Australian Paralympic committee and a couple of their rugby wheelchair athletes. One afternoon during testing we got talking and they mentioned their trip to London. They loved the city, however, they all agreed that the transport and general awareness for people with disabilities was low compared to other cities. I at the time hadn't thought much about how London attractions accomodate people in wheelchairs and those without sight or have trouble hearing. So I looked into it and found that generally speaking each attraction has a page on their website detailing its accessability, however, there wasn't a website or application out there that got all this information for each attraction and put it in one place. This is were AccessAbled comes in!

Accessabled provides information to people about an attractions accessibility from the type of door at the main entrance to nearest accessible tube stops and what line is it accessible via. It is also possible to leave reviews and even add attractions that aren't on the website already.
 
## Demo & Tutorial
[Demo](https://youtu.be/wwby6tJBN7s)

## Tech/framework used

<b>Built with</b>
- [Rails](https://rubyonrails.org/)
- [XML](https://api-portal.tfl.gov.uk/docs)
- [JWT](https://jwt.io/) 

## Project Requirements

- :ballot_box_with_check: Auth
- :ballot_box_with_check: Tests
- :ballot_box_with_check: Multiple has_many_through relationships
- :ballot_box_with_check: Seeds from a complex data set
- :ballot_box_with_check: Custom routes
- :ballot_box_with_check: Custom controller/model methods
- :ballot_box_with_check: Basic database query optimizations
- :ballot_box_with_check: Background jobs for slow actions
- :ballot_box_with_check: Sockets or email integration
- :ballot_box_with_check: One significant refactor
- :ballot_box_with_check: Validation

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## License
[MIT license](https://opensource.org/licenses/mit-license.php)

MIT © [Harry Turner](https://github.com/harrygturner)
