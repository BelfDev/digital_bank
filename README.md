<h1 align="center">
  <br>
  Flow Bank Challenge
  <br>
</h1>

<p align="middle">
  <img src=".github/ios-app-result.jpeg" width="200" height="430" hspace="24" />
  <img src=".github/android-app-result.jpg" width="200" height="430"/>
</p>

## Running the project

### Pre-requisites

This project requires Flutter to be installed on your machine. If you don't already have it, please follow this amazing official [guide](https://flutter.dev/docs/get-started/install). Due to its multi-package nature, after installing Flutter and Dart, you will need to activate `melos` globally. See the sections below for more details on how to run the project.

### Fast setup

For your convenience, a `Makefile` is provided to automate the setup process. Simply choose a directory and run the following command from the root:

```bash
make take-off
```

Don't forget to add the appropriate **environment variables** values to your local `app/.env` file. You can derive them from the PDF with the requirements or by asking the author directly.

### Manual setup

Alternatively, you can follow the steps below to manually setup the project. It's not that bad!

1. Create a `.env` file in the root of the `app` package and add the appropriate environment variables. You can find the keys in `app/.env.sample`. Their values can be derived from the PDF with the requirements or by asking the author directly.
2. Install Flutter and Dart. See the official [guide](https://flutter.dev/docs/get-started/install) for more details.
3. Install `melos` globally with ```flutter pub global activate melos```. If you need more details, please check the official [guide](https://pub.dev/packages/melos).
4. Run ```melos bootstrap``` to install all dependencies and localizations.
5. Go to `app/` and run the project.

```bash
flutter run
```

## Implementation

### Design

The app's primary goal is to **display a list of contacts** provided by either a local or remote data source. Users also have the ability to **search** for specific contacts from the list or tap on tiles to **access further information**.

The graphical user interface and experience were tailored with the [Material](https://material.io/design/foundation-overview) design system in mind. Rather than adapting interface components to each platform's native look, a customized app theme was created to convey a unified look and feel of the *product*'s brand. Certain platform-defining characteristics were preserved (e.g. back button icons and transitions).

<p align="middle">
<img width="400" src=".github/theme-overview.png">
</p>

### Architecture

> “It is not enough for code to work.”
As [uncle Bob](https://books.google.com.br/books?id=_i6bDeoCQzsC&printsec=frontcover&dq=inauthor:%22Robert+C.+Martin%22&hl=pt-BR&sa=X&ved=2ahUKEwjy-tSez7frAhXsLLkGHU41CLMQ6AEwAHoECAQQAg#v=onepage&q&f=false) said, **even bad code can function**. To make sure it is also clean, this project's code is divided into four layers: `Presentation`, `Business Logic`, `Repository`, and `Data Source`.

- **Presentation layer** => Contains reactive [widgets](https://flutter.dev/docs/development/ui/widgets) which draw visual components to the screen (e.g. `OfferCard`).
- **Business Logic** => Is implemented via the [BLoC](https://www.didierboelens.com/2018/08/reactive-programming-streams-bloc/) design pattern, where a middleware listens to streams of events and output states mapped according to some business logic.
- **Repository** => Encapsulates data access logic and exposes a single source of truth. Data _could_ be retrieved from either a local or remote source.
- **Data Source** => Persistence or networking logic to retrieve data.

<p align="middle">
<img width="400" src=".github/frontend-architecture.png">
</p>

### Highlights

- Layered architecture; presentation detached from business logic
- Multi-package workspace with [melos](https://pub.dev/packages/melos) (a.k.a. monorepo)
- Use of StateNotifiers (with [riverpod](https://docs-v2.riverpod.dev/)) for state management
- Single source of truth for fetching data via the repository pattern
- Encryption handling
- Background tasks
- Use of environment variables.
- Dependency injection via the [riverpod](https://docs-v2.riverpod.dev/) package
- Navigation with [go_router](https://pub.dev/packages/go_router)
- Users get visual feedback for `loading`, `error`, and `success` states
- App theming via `DSTheme` - supports light and **dark modes**
- Design system with the internal `ds_components` package
- Data sanitization and input validation
- Form handling with dynamic fields and animations
- Unit tested with [mockito](https://pub.dev/packages/mockito) and code generation
- Custom test helpers
- Localizations (en, pt)

### Additional notes

- In a production App I would also have written integration and golden tests.
- I chose to use `riverpod` for state management it doesn't depend on `BuildContext`, it's relatively easy to understand, and decoupled from a specific architecture pattern. 
- I went with a multi-package workspace structure because I didn't want to simply complete the challenge, but rather demonstrate my take on a scalable architecture.
- I don't have anything against code generation, but I did try to keep it to a minimum this time due to the current size of the project. In the future I would consider adding [freezed](https://pub.dev/packages/freezed) for immutability and union types (and drop [equatable](https://pub.dev/packages/equatable) as it can be relatively vulnerable to human error).
- I'd have written way more tests if I had more time, specially for the `ds_components` package. I focused on showcasing what I consider good practices in `dart`/`flutter`.
- Even though I believe that good code should "document itself", I left some doc comments on certain DS components (e.g., `DSArtworkScaffold`). It could be a good idea to add written documentation to foundation API. If this project were to go open-source, then documentation would be non-negotiable.

## Troubleshooting

### Permission denied error when running `make setup` or `make setup-and-run`

As the prompt suggests, you're lacking permissions to execute the setup script file. To fix that, run the command below from the root directory of the workspace.

```
chmod 755 bin/setup_project.sh 
```

*Thanks for the challenge! It's been a lot of fun* ☺️