# AUTHENTICATION FROM SCRATCH IN RUBY ON RAILS

### Create a new rails application

```
$ rails new authentication-from-scratch

```

### Create a controller users
```
$  bin/rails g controller users new

```

Whit this command we have created a new rails controller with an action "new"

``` ruby
class UsersController < ApplicationController
  def new
  end
end

```

### Create the user model

```
$ bin/rails g model User name:string email:string

```

``` ruby
class User < ApplicationRecord
end
```


### Main Features

Ruby version | Rails version | Bootstrap
------------ | ------------- | ---------
2.5.1        | 5.2.1         | 4.1.3
