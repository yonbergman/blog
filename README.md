# Blog Repository

Welcome to the blog repository! This repository contains the source code and data for the blog, including posts, talks, and other related content.

## Structure

The repository is organized as follows:

- `_data/`: Contains YAML files with data for the blog, such as talks and other metadata.
- `_posts/`: Contains the markdown files for individual blog posts.
- `images/`: Contains images used in blog posts and talks.
- `_layouts/`: Contains HTML layouts for rendering the blog pages.
- `_includes/`: Contains reusable HTML snippets for the blog pages.

## Getting Started

To get started with the blog repository, follow these steps:

1. **Clone the repository**:

    ```sh
    git clone https://github.com/yourusername/blog.git
    cd blog
    ```

2. **Install dependencies**:
    Make sure you have [Jekyll](https://jekyllrb.com/) installed. Then, install the required dependencies:

    ```sh
    bundle install
    ```

3. **Run the server**:
    Start the Jekyll server to serve the blog locally:

    ```sh
    bundle exec jekyll serve
    ```

4. **Open your browser**:
    Open your browser and navigate to `http://localhost:4000` to see the blog.

## Talks

The `_data/talks.yml` file contains information about various talks given by the author. Each talk entry includes the following fields:

- `name`: The title of the talk.
- `when`: The date of the talk.
- `where`: The event where the talk was given.
- `link`: A link to the talk or related content.
- `image`: A path to an image associated with the talk.

Create a new entry in the `talks.yml` file to add a new talk to the blog.

Add an image for the talk in the `images/talks/` directory and reference it in the talk entry. Make sure the image is in the correct format and sized 280x280 pixels.

## How to Contribute

If you would like to contribute to the blog, please follow these steps:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes and commit them with clear commit messages.
4. Push your changes to your fork.
5. Create a pull request to the main repository.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

## Contact

If you have any questions or suggestions, feel free to open an issue or contact the repository owner.

Happy blogging!
