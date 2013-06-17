# Antree

Antree is a tiny gem to ease android layout development.
It's showing the files dependencies used in the given layouts and let you execute a command on them.

## Installation

Add this line to your application's Gemfile:

    gem 'antree'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install antree

## Usage
    pcboy@home ☭  res % antree --help
    Options:
    --command, -c <s>:   the command to execute on selected items
    --files, -f <s+>:   the layouts to parse
    --help, -h:   Show this message

Example:
   pcboy@home ☭  res % ruby antree.rb --command vim --files layout/chat_msg.xml layout/chat_msgs.xml
   [
    [0] "src/main/res/drawable-xhdpi/bubble_yellow.9.png",
    [1] "AndroidChatBubbles/HelloBubbles/res/drawable-xhdpi/bubble_yellow.9.png",
    [2] "src/main/res/drawable/edittext.xml",
    [3] "src/main/res/drawable-hdpi-v4/edittext_indented_active.9.png",
    [4] "src/main/res/drawable-hdpi-v4/edittext_indented_normal.9.png"
   ]
   Comma-separate the files' number you want to execute your <command> on:
   2

Will run vim on edittext.xml

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
