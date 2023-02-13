<h1 align="center">
  <br>
  Flow Bank Challenge
  <br>
</h1>

## Running the project

### Pre-requisites

This project requires Flutter to be installed on your machine. If you don't have it already, please follow this amazing official [guide](https://flutter.dev/docs/get-started/install). Due to this project's multi-package nature, after installing Flutter and Dart, you will need to activate `melos` globally. See the sections below for more details.

### Fast-track setup

For your convenience, a `Makefile` was created to automate the setup process. Simply choose a directory, clone the project, and run the following command from the workspace root:

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

### Architecture

> “It is not enough for code to work.”
As [uncle Bob](https://books.google.com.br/books?id=_i6bDeoCQzsC&printsec=frontcover&dq=inauthor:%22Robert+C.+Martin%22&hl=pt-BR&sa=X&ved=2ahUKEwjy-tSez7frAhXsLLkGHU41CLMQ6AEwAHoECAQQAg#v=onepage&q&f=false) said, **even bad code can function**.

This project follows a multi-layered architecture inspired by Clean and MVVM, where the presentation layer is detached from the business logic. To enforce SOLID and DRY principles, it is divided into nine packages, each with its own responsibility. My motivation was to demonstrate how to build a scalable Flutter project which is easy to maintain and extend, even if the company grows rapidly.

#### Relevant package types
- `app` => Contains the `main.dart` file and the app's entry point.
- `features` => Each feature is a package that contains all the code related to a specific feature.
- `packages` => Contains packages that are shared across multiple features. For example, a `ds_components` package that contains all the custom, design-system widgets used in the app.

#### Architecture overview
- **Presentation layer** => Contains reactive [widgets](https://flutter.dev/docs/development/ui/widgets) that draw visual components to the screen.
  - Pages and Components are implemented as Widgets and are responsible for rendering the UI with composition.
  - Controller classes are responsible for interpreting the state emitted by the State Manager and returning the Widget that correctly represents that state. They also connect user interactions to the State Manager or side effects such as navigation.
- **Business Logic layer** => A middleware reacts to events and output states mapped according to some business logic.
    - State Managers via [riverpod](https://docs-v2.riverpod.dev/) StateNotifiers. May contain business logic and communicates with the Data Access layer via a repository.
    - Use Cases are often used for executing specific (and reusable) business logic.
- **Data Access layer** => Contains a set of abstractions responsible for accessing data, whether from a local or remote data source.
  - Repository is the single source of truth to access data from the Business Logic Layer. Data _could_ be retrieved from either a local or remote source.
  - Services are responsible for wrapping functionality such as fetching data from a remote source.

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
- The app is optimized for iOS and Android.

## Troubleshooting

### Permission denied error when running `make setup` or `make setup-and-run`

As the prompt suggests, you're lacking permissions to execute the setup script file. To fix that, run the command below from the root directory of the workspace.

```
chmod 755 bin/setup_project.sh 
```

*Thanks for the challenge! It's been a lot of fun* ☺️