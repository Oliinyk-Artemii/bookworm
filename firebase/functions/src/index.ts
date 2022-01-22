import * as functions from "firebase-functions";

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

export const helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});

export const sendMessage = functions.https.onRequest((request, response) => {
  functions.logger.info("sendMessage request", {structuredData: true});
  if (request.method === 'GET') { // || !request.body.message) {
    functions.logger.info("GET request", {structuredData: true});
    response.send('Hello! This get function of our messager');
  }


});
