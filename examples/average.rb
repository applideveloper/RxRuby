require 'rx_ruby'

# Without a selector
source = RxRuby::Observable.range(0, 9).average

subscription = source.subscribe(
    lambda {|x|
        puts 'Next: ' + x.to_s
    },
    lambda {|err|
        puts 'Error: ' + err.to_s
    },
    lambda {
        puts 'Completed'
    })

# => Next: 4
# => Completed

# With a selector
arr = [
    { value: 1 },
    { value: 2 },
    { value: 3 }
]

source = RxRuby::Observable.from_array(arr).average {|x|
    x[:value]
}

subscription = source.subscribe(
    lambda {|x|
        puts 'Next: ' + x.to_s
    },
    lambda {|err|
        puts 'Error: ' + err.to_s
    },
    lambda {
        puts 'Completed'
    })

# => Next: 2
# => Completed
