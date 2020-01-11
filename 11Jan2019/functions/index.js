const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {
    let name = request.query.name;
    admin.database().ref().child("name").set(name).then((res)=>{
        admin.database().ref().on("value",(snap)=>{
            response.send({
                message:snap.val()
            });
        },(cancel)=>{

        });
    }).catch((e)=>{

    });
});

exports.dbTrigger = functions.database.ref("posts/{pushId}").onCreate((snap,context)=>{
   // admin.auth().getUser(context.auth.uid).then((user)=>{
   //
   // })
   //  let uid = snap.val().uid;
   //  let countRef =   admin.database().ref("users/"+uid+"/count");
   //  countRef.once("value",(snap)=>{
   //      let count = parseInt(snap.val());
   //      countRef.set(++count).then((res)=>{
   //
   //      },(e)=>{
   //
   //      });
   //  });
   return admin.database().ref("count").once("value",(snap)=>{
       let count = parseInt(snap.val());
       admin.database().ref("count").set(++count).then((res)=>{

       },(e)=>{

       });
   });
});


exports.authTrigger = functions.auth.user().onCreate((user,context)=>{
    admin.database().ref("users").child(user.uid).set({
        name:user.displayName,
        id:user.uid,
        pic:user.photoURL,
        phone:user.phoneNumber,
        email:user.email,
    });
});







