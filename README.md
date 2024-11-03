# mit-geolocation

MIT Geolocation Plugin

## Installation

```sh
npm install mit-geolocation
```

## Usage


```js
import { searchAddressByCoord } from 'mit-geolocation';

const result = await searchAddressByCoord("-6.3125659999999995", "106.8620154", "your-registered-token");
```


```js
import { searchAddressByName } from 'mit-geolocation';

const result = await searchAddressByName("tugu jogja", "your-registered-token");
```


## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---