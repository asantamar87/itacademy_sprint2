📺 Level 2 - Exercise 1: Mini YouTube Database Model

Welcome to the Mini YouTube project!
This repository contains the design and data modeling of a simplified version of YouTube. The goal is to create a structured and scalable database that captures the essential features of a video-sharing platform.
🧠 Project Scope

This project models the core functionality of a reduced YouTube system, including users, videos, channels, playlists, likes/dislikes, and comments.
👤 Users

Each user has:

    A unique ID

    Email address

    Password

    Username

    Date of birth

    Gender

    Country

    Postal code

📹 Videos

Each video contains:

    A unique ID

    Title

    Description

    File size

    Video file name

    Duration

    Thumbnail

    View count

    Number of likes

    Number of dislikes

    Publication date & time

    Published by (user)

🔐 Video Status

A video can be:

    Public

    Unlisted

    Private

🏷️ Tags

    A video can have multiple tags

    Each tag has:

        A unique ID

        Tag name

📺 Channels

    A user can create one or more channels

    Each channel has:

        A unique ID

        Name

        Description

        Creation date

    🔗 Channels are linked to the user who owns them.

🔔 Subscriptions

    A user can subscribe to other users' channels

    Subscriptions are one-way (A subscribes to B)

👍 Reactions (Likes / Dislikes)

    A user can like or dislike a video only once

    The system stores:

        User who reacted

        Video ID

        Type of reaction (like/dislike)

        Date/time of reaction

    This applies similarly to comments.

📂 Playlists

Users can create playlists with their favorite videos.

Each playlist has:

    A unique ID

    Name

    Creation date

    Visibility status: Public or Private

    🔄 A playlist can contain many videos, and a video can appear in many playlists.

💬 Comments

Users can post comments on videos.

Each comment has:

    A unique ID

    Comment text

    Date and time of posting

    Video it belongs to

    User who posted it

👍 Comment Reactions

    Users can like or dislike comments

    Each reaction stores:

        User ID

        Comment ID

        Reaction type (like/dislike)

        Timestamp

📁 Project Contents

This repository may include:

    ER diagrams

    SQL schema definitions

    Data modeling notes

    Sample data or queries

🛠️ Future Development Ideas

    API for video uploading and streaming

    Frontend mockup for user interaction

    Admin tools for moderating content

    Analytics: most liked videos, top users, etc.

🤝 Contributions

Feel free to open issues, ask questions, or propose improvements via pull requests. Let's build a cleaner and smarter database model together!