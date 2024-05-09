module Effect.Debouncing
       ( Debounce
       , debounce
       , throttle
       , throttleWithDebounceAtEnd
       , call )
where

import Effect (Effect)
import Prelude


foreign import data Debounce :: Type

foreign import debounceImpl :: forall a. (a -> Effect Unit) -> Int -> Debounce
foreign import throttleImpl :: forall a. (a -> Effect Unit) -> Int -> Debounce
foreign import throttleWithDebounceAtEndImpl :: forall a. (a -> Effect Unit) -> Int -> Debounce
foreign import callImpl :: forall a. Debounce -> a -> Effect Unit

debounce :: forall a. (a -> Effect Unit) -> Int -> Debounce
debounce = debounceImpl

throttleWithDebounceAtEnd :: forall a. (a -> Effect Unit) -> Int -> Debounce
throttleWithDebounceAtEnd = throttleWithDebounceAtEndImpl

throttle :: forall a. (a -> Effect Unit) -> Int -> Debounce
throttle = throttleImpl

call :: forall a. Debounce -> a -> Effect Unit
call = callImpl
