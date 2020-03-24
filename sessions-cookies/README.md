# Review

- Request/Response cycle: Client speaks a request that server was listening for, server speaks back with a response the client was waiting for.

- Afterwards, server goes "back to zero"

# Takeaways

- Every new request loses all prev request's @ivars
- Including redirects, b/c redirect triggers fresh request/response
- use session hash to access/set values with typical hash syntax
- next request from that client will carry newly set session values
- sessions persist indefinitely (by default)
- flash[:keyname] is also a way to set session info a la hash
- flash will persist only one more request/response


# Rails Quest
We have a pre-built trivia app which presents the user with questions in succession, and allows them to answer.
We can check in our controller whether the user answered correctly or not, but how can we get the server to 'remember' how many questions a user has answered correctly for as long as they are on the site?

## Deliverables
* Add a feature which displays the number of questions a user has answered correctly
* Add a message which tells the user whether or not they got the last answer correct

## External Resources:

- [Rails Docs on Sessions](https://guides.rubyonrails.org/security.html#sessions)
- [Wiki Page on HTTP Headers](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields)