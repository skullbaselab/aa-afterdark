// Bad example!
const abnormalState = {
  users: {
    1: {
      name: 'Phil',
      photos: [
        {
          url: 'path_to_url',
          comments: [
            {
              body: 'Phil! I love this photo!!',
              user: {
                name: 'Jan',
                photos: [
                  {
                    url: 'path_to_url',
                    comments: [
                      {
                        body: 'Jan! What a great photo!!',
                        user: {
                          name: 'Phil',
                          photos: [
                            // This is a spiral of abnormality. Don't do this!
                          ],
                        },
                      },
                    ],
                  },
                ],
              },
            },
          ],
        },
      ],
    },
  },
};

// *********************************
// Good Example!

const normalizedState = {
  users: {
    1: {
      name: 'Phil',
      id: 1,
      follows: [2],
      photos: [1, 2],
    },
    2: {
      name: 'Jan',
      id: 1,
    },
  },
  photos: {
    1: {
      id: 1,
      url: 'path_to_image',
      owner: 1, // Phil
    },
    2: {
      id: 2,
      url: 'path_to_image',
      owner: 1,
    },
  },
  comments: {
    1: {
      author_id: 2,
      photo_id: 1,
      body: 'Phil! I love this photo!!',
    },
  },
};
