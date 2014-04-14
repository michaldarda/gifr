## Gifr

Command line tool to easily create animated gifs from movies.

## Requirements

On Ubuntu (14.04), please install

    $ sudo add-apt-repository ppa:samrog131/ppa

    $ sudo apt-get update

    $ sudo apt-get install ffmpeg-real

## Installation

Type:

    $ gem install gifr


## Usage

    $ gifr video.mp4 -s 00:00:00 -t 7 output.gif

Available options

`-s or --start` moment int movie to start in format `hh:mm:ss`
`-t or --time` how long should animated gif last

You can optionally provide also:
`-d or --delay` the speed of gif's animation, default is 20

## Contributing

1. Fork it (http://github.com/michaldarda/gifr/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

When submiting your PR please make sure you've added tests and they are passing.

## License

Copyright &copy; 2014 Michal Darda <michaldarda@gmail.com>
