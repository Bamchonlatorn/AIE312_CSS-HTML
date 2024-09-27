# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
  attr_accessor :name, :email, :password

  def initialize(name, email, password)
    @name = name
    @email = email
    @password = password
  end

  def enter_room(room)
    room.add_user(self)
    puts "#{@name} has entered the room: #{room.name}"
  end


  def send_message(room, content)
    message = Message.new(self, room, content)
    room.broadcast(message)
  end
    
  def acknowledge_message(message)
    puts "#{@name} received message in #{message.room.name}: #{message.content}"
  end
end


# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
    end
  
    # Add user to the room
    def add_user(user)
      @users << user
    end

    def broadcast(message)
    puts "Message from #{message.user.name} to room #{name}: #{message.content}"

    @users.each do |user|
      if user != message.user  # Do not send the message back to the sender
        user.acknowledge_message(message)
      end
    end
  end
end
    
  
# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
  attr_accessor :user, :room, :content

  def initialize(user, room, content)
    @user = user
    @room = room
    @content = content
  end
end

# Create users
user1 = User.new("Bam", "chonlatorn.karn@bumail.net", "password3499")
user2 = User.new("Tressa", "Tress@bumail.net", "password5981")

# Create a room
room1 = Room.new("General Chat", "A room for meeting and discussion")

# add a method to user so, user can enter to a room
# user.enter_room(room)
user1.enter_room(room1)
user2.enter_room(room1)

# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)
user1.send_message(room1, "Welcome to the room!")
user2.send_message(room1, "Hello How are you doing!")

# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)
