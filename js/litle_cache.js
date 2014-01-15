/*!
 * LittleCacheJs v1.0.0
 * Copyright 2013-2014 Steven Titren <contact@webaki.com>
 * Licensed under MIT (https://github.com/flyos/litlecachejs/blob/master/LICENSE)
 */

var LitleCache;

LitleCache = (function() {
  function LitleCache() {
    this.cached = {};
    this._disabled = false;
  }

  LitleCache.prototype.hasItem = function(key) {
    if (this.disabled()) {
      return false;
    } else {
      return this.cached[key] != null;
    }
  };

  LitleCache.prototype.setItem = function(key, value) {
    this.cached[key] = value;
    return this;
  };

  LitleCache.prototype.getItem = function(key, defaultValue) {
    if (defaultValue == null) {
      defaultValue = false;
    }
    if (this.hasItem(key)) {
      return this.cached[key];
    } else {
      return defaultValue;
    }
  };

  LitleCache.prototype.get = function(key, defaultValue) {
    if (key == null) {
      return this.cached;
    } else {
      return this.getItem(key, defaultValue);
    }
  };

  LitleCache.prototype.removeItem = function(key) {
    if (this.hasItem(key)) {
      delete this.cached[key];
    }
    return this;
  };

  LitleCache.prototype.clear = function() {
    this.cached = {};
    return this;
  };

  LitleCache.prototype.enable = function() {
    return this._disabled = false;
  };

  LitleCache.prototype.disable = function() {
    return this._disabled = true;
  };

  LitleCache.prototype.enabled = function() {
    return !this._disabled;
  };

  LitleCache.prototype.disabled = function() {
    return this._disabled;
  };

  return LitleCache;

})();
