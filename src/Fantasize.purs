module Fantasize where

  import Data.Monoid

  foreign import fantasySemigroup
    "function fantasySemigroup(dict) {\
    \  return function(s) {\
    \    s.constructor.prototype.concat = function(that) {\
    \      return dict['<>'](this)(that);\
    \    };\
    \  };\
    \}" :: forall s. (Semigroup s) => s -> {}

  foreign import fantasyMonoid
    "function fantasyMonoid(dict) {\
    \  return function(m) {\
    \    m.constructor.prototype.empty = function() {\
    \      return dict['mempty'];\
    \    };\
    \  };\
    \}" :: forall m. (Monoid m) => m -> {}

  foreign import fantasyFunctor
    "function fantasyFunctor(dict) {\
    \  return function(f) {\
    \    f.constructor.prototype.map = function(func) {\
    \      return dict['<$>'](func)(this);\
    \    };\
    \  };\
    \}" :: forall a f. (Functor f) => f a -> {}

  foreign import fantasyApply
    "function fantasyApply(dict) {\
    \  return function(f) {\
    \    f.constructor.prototype.ap = function(x) {\
    \      return dict['<*>'](this)(x);\
    \    };\
    \  };\
    \}" :: forall a f. (Apply f) => f a -> {}

  foreign import fantasyApplicative
    "function fantasyApplicative(dict) {\
    \  return function(f) {\
    \    f.constructor.prototype.of = function(x) {\
    \      return dict['pure'](x);\
    \    };\
    \  };\
    \}" :: forall a f. (Applicative f) => f a -> {}

  foreign import fantasyChain
    "function fantasyChain(dict) {\
    \  return function(m) {\
    \    m.constructor.prototype.chain = function(x) {\
    \      return dict['>>='](this)(x);\
    \    };\
    \  };\
    \}" :: forall a m. (Bind m) => m a -> {}
