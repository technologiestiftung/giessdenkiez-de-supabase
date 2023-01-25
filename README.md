![](https://img.shields.io/badge/Built%20with%20%E2%9D%A4%EF%B8%8F-at%20Technologiestiftung%20Berlin-blue)

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->

[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)

<!-- ALL-CONTRIBUTORS-BADGE:END -->

# Giessdenkiez.de Supabase

## Deprecation Notice

The content of this repository is deprecated and will be removed soon. Please use the new repository https://github.com/technologiestiftung/giessdenkiez-de-postgres-api instead.

<!--


Bonus:

Use all-contributors

npx all-contributors-cli check
npx all-contributors-cli add ff6347 doc

You can use it on GitHub just by commeting on PRs and issues:

```
@all-contributors please add @ff6347 for infrastructure, tests and code
```
Read more here https://allcontributors.org/


Get fancy shields at https://shields.io
 -->

Running the giessdenkiez.de stack on supabase. WIP please ignore.

## Prerequisites

- Supabase account
- Docker
- Supabase CLI installed

## Installation

- Clone this repo
- install dependencies with `npm ci`
- Login into supabase with `supabase login`

## Usage or Deployment

- Create a project on supabase.com
- Configure your GitHub actions to deploy all migrations to staging and production. See [.github/workflows/deploy-to-supabase-staging.yml](.github/workflows/deploy-to-supabase-staging.yml) and [.github/workflows/deploy-to-supabase-production.yml](.github/workflows/deploy-to-supabase-production.yml) for an example. We are using actions environments to deploy to different environments. You can read more about it here: https://docs.github.com/en/actions/reference/environments.
  - Needed variables are:
    - `DB_PASSWORD`
    - `PROJECT_ID`
    - `SUPABASE_ACCESS_TOKEN`
- **(Not recommended but possible)** Link your local project directly to the remote `supabase link --project-ref <YOUR PROJECT REF>` (will ask you for your database password from the creation process)
- **(Not recommended but possible)** Push your local state directly to your remote project `supabase db push` (will ask you for your database password from the creation process)

### Radolan Harvester

if you want to use the [DWD Radolan harvester](https://github.com/technologiestiftung/giessdenkiez-de-dwd-harvester) you need to prepare some data in your database

- Update the table `radolan_harvester` with a time range for the last 30 days

```sql
INSERT INTO "public"."radolan_harvester" ("id", "collection_date", "start_date", "end_date")
	VALUES (1, (
			SELECT
				CURRENT_DATE - INTEGER '1' AS yesterday_date),
		(
			SELECT
				(
					SELECT
						CURRENT_DATE - INTEGER '31')::timestamp + '00:50:00'),
				(
					SELECT
						(
							SELECT
								CURRENT_DATE - INTEGER '1')::timestamp + '23:50:00'));
```

- Update the table `radolan_geometry` with sql file [radolan_geometry.sql](sql/radolan_geometry.sql) This geometry is Berlin only.
- Populate the table radolan_data with the content of [radolan_data.sql](sql/radolan_data.sql)

This process is actually a little blackbox we need to solve.

## Development

- Run `supabase start` to start the supabase stack
- Run `supabase stop` to stop the supabase stack (all changes not included in a migration will be lost)
- make changes to your db using sql and run `supabase db diff --file <MIGRATION FILE NAME> --schema public --use-migra` to create migrations
- Run `supabase gen types typescript --local > ./scripts/db-types.ts` to generate typescript types for your db

## Tests

- Run `npm test` to run the tests

## Contributing

Before you create a pull request, write an issue so we can discuss your changes.

## Contributors

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://fabianmoronzirfas.me/"><img src="https://avatars.githubusercontent.com/u/315106?v=4?s=64" width="64px;" alt="Fabian Morón Zirfas"/><br /><sub><b>Fabian Morón Zirfas</b></sub></a><br /><a href="https://github.com/technologiestiftung/giessdenkiez-de-supabase/commits?author=ff6347" title="Documentation">📖</a> <a href="https://github.com/technologiestiftung/giessdenkiez-de-supabase/commits?author=ff6347" title="Code">💻</a> <a href="#infra-ff6347" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a></td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td align="center" size="13px" colspan="7">
        <img src="https://raw.githubusercontent.com/all-contributors/all-contributors-cli/1b8533af435da9854653492b1327a23a4dbd0a10/assets/logo-small.svg">
          <a href="https://all-contributors.js.org/docs/en/bot/usage">Add your contributions</a>
        </img>
      </td>
    </tr>
  </tfoot>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->


<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

## Credits

<table>
  <tr>
    <td>
      Made by <a href="https://citylab-berlin.org/de/start/">
        <br />
        <br />
        <img width="200" src="https://citylab-berlin.org/wp-content/uploads/2021/05/citylab-logo.svg" />
      </a>
    </td>
    <td>
      A project by <a href="https://www.technologiestiftung-berlin.de/">
        <br />
        <br />
        <img width="150" src="https://citylab-berlin.org/wp-content/uploads/2021/05/tsb.svg" />
      </a>
    </td>
    <td>
      Supported by <a href="https://www.berlin.de/rbmskzl/">
        <br />
        <br />
        <img width="80" src="https://citylab-berlin.org/wp-content/uploads/2021/12/B_RBmin_Skzl_Logo_DE_V_PT_RGB-300x200.png" />
      </a>
    </td>
  </tr>
</table>

## Related Projects

```

```
