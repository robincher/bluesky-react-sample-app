# Bluesky React sample app

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

It will illustrate how we can test, build and package a web app before publishing into a registry with automation via Github actions.

For the second part of this demo, please go to [Bluesky GitOps](https://github.com/robincher/bluesky-gitops-demo)

## Workflow

![bluesky-wf-code.png](https://github.com/robincher/bluesky-react-sample-app/blob/master/assets/bluesky-wf-code.png?raw=true)

1. A developer can trigger a release by updating a Git reponsitory which contains the application code
2. Github Actions will test , build and package the web app into a container
3. Upon packaging , Github actions will publish the container to a container registry

## Instruction for using this sample App

### Available Scripts

In the project directory, you can run:

#### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.\
You will also see any lint errors in the console.

#### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

#### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

#### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can’t go back!**

If you aren’t satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you’re on your own.

You don’t have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn’t feel obligated to use this feature. However we understand that this tool wouldn’t be useful if you couldn’t customize it when you are ready for it.

### Packaging 

#### Build docker image
`docker build -t reponame/imagename:tag .`

#### Run local docker container
`docker run -d --name containername -p 3000:3000 reponame/imagename:tag`


#### Helm

1. Generating helm template 

`helm create <<chart-name>>`

2. Modification on the default values

Update container port to 3000, since our code are running on port 3000

```
ports:
    - name: http
        containerPort: 3000
        protocol: TCP
```

3. Install via helm

Install helm chart for bluesky react. 

`helm install <<release-name>> ./helm --kube-context <<kube context>>`

4. Port forward for your own testing

`kubectl port-forward service/release-name 3011:3000`

 Try testing the page response

`curl http://localhost:3011`

5. Clean-up helm chart

`helm uninstall <<release-name`

## Learn More

More about Github actions [Github Actions with Container Push](https://docs.github.com/en/packages/guides/using-github-packages-with-github-actions)

Dockerizing an react app [Deploying React App to DigitalOcean](https://dev.to/kenessajr/deploy-a-react-app-to-digitalocean-using-github-actions-and-docker-4pln)

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).
