# purescript-debouncing

PureScript bindings for
[debouncing](https://www.npmjs.com/package/debouncing).

There are 2 functions: `debounce` (wait predefined amount of time,
before calling the function) or `throttle` (delay function calling to
intervals of defined length).

Additionally, there is `throttleWithDebounceAtEnd`: since the
`throttle` function fires at specific intervals and might not call the
function with last provided argument, we have this function which
makes sure the last argument is called as well.
