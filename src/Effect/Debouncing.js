import { debounce, throttle } from 'debouncing';


export const debounceImpl = (f) => (interval) => {
  let self = this;
  
  // We need to do this because f is effectful and is wrappd in a function
  return debounce((...args) => { return f.apply(self, args)() }, interval);
}

export const throttleImpl = (f) => (interval) => {
  let self = this;

  // We need to do this because f is effectful and is wrappd in a function
  return throttle((...args) => { return f.apply(self, args)() }, interval);
}

// Similar to throttle, but makes sure it fires also at the end
// (throttle just fires every 'timeout' ms and might not be fired for
// last call).
const throttleWithDebounceAtEnd = (func, timeout = 250) => {
  let /** ?number */ timer;
  let lastTimer;

  return (...args) => {
    const deferred = () => {
      timer = null;
      func(...args);
    };

    const lastDeferred = () => {
      lastTimer = null;
      if(timer) { return; }
      func(...args);
    };

    if (!timer) timer = setTimeout(deferred, timeout);

    lastTimer && clearTimeout(lastTimer);
    lastTimer = setTimeout(lastDeferred, timeout);    
  };
};

export const throttleWithDebounceAtEndImpl = (f) => (interval) => {
  let self = this;

  // We need to do this because f is effectful and is wrappd in a function
  return throttleWithDebounceAtEnd((...args) => { return f.apply(self, args)() }, interval);
}

export const callImpl = (d) => (a) => () => {
  d(a);
}
