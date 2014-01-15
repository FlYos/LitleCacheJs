# LitleCacheJs

Simple cache manager for your javascript applications


## How to use

include js file and create new cache instance:

```javascript
var myCache = new LitleCache();
```

### Add data :

```javascript
myCache.setItem('hello', ['World', 'Steven']);
```

### Test if key exists
```javascript
myCache.hasItem('hello');
```

### Get value
```javascript
myCache.getItem('hello', 'my value if not exists')
```

### Other methods
 - LitleCache.get(key)
 - LitleCache.removeItem(key)
 - LitleCache.clear
 - LitleCache.enable
 - LitleCache.disable
 - LitleCache.enabled
 - LitleCache.disabled
