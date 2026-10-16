# Week 1 - Back to basics

As I have decided to work through the tutorials on SQLBolt, and it's been a little while since I used SQL, I decided to start from the start and work my way through.

## Topics covered

This week, I practiced simple queries using SELECT, FROM, WHERE, ORDER BY and LIMIT/OFFSET. I also began practicing with JOINS, which will be my main focus for next week.

## New Skills

This has been more of a revision week, and I found writing these simnple queries to be rather straightforward. OFFSET however is something that wasn't covered in my previosu course,
and it was interesting thinking of ways this could be applied in a practical sense. For example separating data into pages for use on a website. Smoothing out these gaps in my 
knowledge is exactly why I'm doing this review, which I find encouraging.

## Challenges

One of the practice questions on SQLBolt asked me to find all North American cities west of Chicago, and list them from South to North. The easiest way to have done this would be
to write a simple query to find the longitude of Chicago, which I knew was present in the dataset, and then write a second query including that static number to get the data I wanted.

However, If I was working in a professional setting I might need to repeat queries like this for different cities, so I thought it would be simpler in the long run to write one that
was easily repeatable. This led me to think about how I could nest queries within one another to include that first simple query within the body of the main query, like this:

```
SELECT *
FROM north_american_cities
WHERE Longitude < (SELECT Longitude
        FROM north_american_cities
        WHERE City = "Chicago")
ORDER BY Longitude ASC;
```

Running this code and seeing it work was very satisfying.

## Next Target

Towards the end of the week I began working with JOINS, which I also covered on my previous course, but feel will need a little more practice to fully wrap my head around. I am excited
for the challenge, however.
