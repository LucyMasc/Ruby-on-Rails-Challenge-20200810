# Ruby-on-Rails-Challenge-20200810
## Back-End

REST API built using Ruby on Rails and MySQL with restrict access through Api-Key.

You can test it out on https://rapi-cdsh.herokuapp.com/products

Oops! Access Denied! 

On your CLI paste the following command:

  <pre><code>
    rails c
    url = %x{ curl https://rapi-cdsh.herokuapp.com/products -H 'Authorization: Token token="6c712a48042f610461391ea05fee18f7"' }
    JSON.parse(url) 
  </code></pre>

  and there we go, you can visualize all products.
  
  But hurry up! This api key must expire soon.


