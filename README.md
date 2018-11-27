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
$ bin/rails g model User name:string surname:string email:string

```

``` ruby
class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum: 50}
  validates :surname, presence: true, length: {maximum: 200}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}

end
```

### Add index to users email
```
$ bin/rails g migration add_index_to_user_email
```

``` ruby
class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true
  end
end
```

### Adding a secure password
``` ruby
  class User < ApplicationRecord
    ...

    ...

    has_secure_password
    validates :password, presence: true, length: {minimum: 8}
  end
```
When incleded in a model as above, this one method adds the following functionality:
* The ability to save a securely hashed password_digest attribute to the database
* A pair of virtual attributes (password and password_confirmation), including presence validation upon object creation and a vaidations upon object creation and a validation requiring that they match
* An authenticate method that returns the user when the password is correct(and false otherwise)





### Main Features

Ruby version | Rails version | Bootstrap
------------ | ------------- | ---------
2.5.1        | 5.2.1         | 4.1.3
