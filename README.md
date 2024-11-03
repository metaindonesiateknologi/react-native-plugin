# mit-geolocation

MIT Geolocation Plugin

## Installation

```sh
npm install https://github.com/metaindonesiateknologi/react-native-plugin.git
```

OR 

add package repository into your package.json:
```sh
"mit-geolocation": "github:metaindonesiateknologi/react-native-plugin"
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