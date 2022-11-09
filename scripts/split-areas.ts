// import json files from the data folder
import areas from "../data/bezirksgrenzen.geo.json" assert { type: "json" };
import fs from "node:fs";
import path from "node:path";
console.info(areas);

// split the areas into individual files node
for (const feature of areas.features) {
	const name = feature.properties.Gemeinde_name;
	const filename = `./data/${name.toLowerCase().replace(" ", "_")}.geo.json`;
	const geojson = {
		type: "FeatureCollection",
		features: [feature],
		crs: { type: "name", properties: { name: "urn:ogc:def:crs:OGC:1.3:CRS84" } },
	};
	const data = JSON.stringify(geojson);
	fs.writeFileSync(path.resolve(process.cwd(), filename), data);
}
