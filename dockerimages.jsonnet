local dockerBuild(name, needs) = {
  needs: needs,
  'runs-on': 'ubuntu-latest',
  steps: [
    { uses: 'actions/checkout@v1' },
    {
      name: std.format('Build %s', name),
      run: std.format(|||
        docker login -u ${{ secrets.DOCKER_USER }} -p ${{ secrets.DOCKER_PASS }} quay.io
        docker build -f %(name)s/Dockerfile -t quay.io/johannweging/%(name)s:latest ./%(name)s
        docker push quay.io/johannweging/%(name)s:latest
      |||, { name: name }),
    },
  ],
};

local jobs(images) = {
  [image.image]: dockerBuild(image.image, image.needs)
  for image in images
};


local pipeline(images) = {
  name: 'Build Docker Images',
  on: {
    push: {},
    schedule: [{ cron: '0 12 * * THU' }],

  },
  jobs: jobs(images),
};

local images = [
  { image: 'vault2env', needs: [] },
  { image: 'terraform', needs: ['vault2env'] },
  { image: 'homeassistant', needs: [] },
  { image: 'fluentd', needs: [] },
  { image: 'docker-compose', needs: ['vault2env'] },
];

std.manifestYamlDoc(pipeline(images))
