download the project, install the pods and build run.

The architecture pattren i have used in this is MVVM with combine and viper. I'm using this in of my project it is extreamly easy and very good to keep code clean and saperate.

For the api calling, i'm using Alamofire, I have created network manager with very limited methods.

For offline records i tried to implement Realm which didn't worked for me. and wasted a lot of time and r&d. i'll be looking into it furthermore. but currently now i'm saving record in User Defaults for offline use. which definately not a good approch but right now it is like this.

By 3 dots button you can change the api call according to nunber of days, like we have 1,7 and 30 days limit.

seach button will allow you to seach any data you want to.

note: Test Cases are missed.
