

import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;

    final Color backgroundColor = Color(0xfffbfcff);
    return Scaffold(

      appBar: AppBar(title: Text("Profile"),
      elevation: 0,
      backgroundColor: backgroundColor.withOpacity(0),
      actions: [
        IconButton(
          onPressed: (){},
          icon:Icon(Icons.more_horiz_rounded)
        ),
        SizedBox(width: 16,)
      ],

      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
          Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: themeData.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1))
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.img.stories.story8.image(width: 84, height: 84)),
                
                            SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("@Joviedan", style: themeData.textTheme.headlineSmall,),
                                  SizedBox(height: 4,),
                                  Text("Jovi Daneal"),
                                  SizedBox(height: 8,),
                
                                  Text("Ux desinger", style: themeData.textTheme.titleMedium!.apply(color: themeData.colorScheme.primary)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                        child: Text("About Me", style: themeData.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold)),
                        
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                        child: Text("Madison Blackstone is a director of user experience design, with experience managing global teams.",
                        style: themeData.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w200),),
                      ),
                      SizedBox(height: 28,),                            
                    ],
                  ),
                ),
                
                Positioned(
                  bottom: 0,
                  left: 96,
                  right: 96,
        
                  child: Container(
                    height: 32,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 30, 
                        color: Colors.black.withOpacity(0.8),
                         
                      )
                    ]
                  ),
                )),
                Positioned(
                  bottom: 0,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: themeData.colorScheme.primary,
                    ),
        
                    child: 
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff2151cd),
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("52", style: themeData.textTheme.titleMedium,),
                                SizedBox(height: 4,),
                                Text("Post", style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w300)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("250", style: themeData.textTheme.titleMedium,),
                              SizedBox(height: 4,),
                              Text("Following", style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("4.5K", style: themeData.textTheme.titleMedium,),
                              SizedBox(height: 4,),
                              Text("Followers", style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          Container(
        
            decoration: BoxDecoration(
              color: themeData.colorScheme.surface ,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        
              child: Column(
                children: [
        
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Expanded(child: Text("My Posts", style: themeData.textTheme.titleLarge!.copyWith(fontSize: 20),)),
                    IconButton(onPressed: (){}, icon: Assets.img.icons.grid.svg()),
                    IconButton(onPressed: (){}, icon: Assets.img.icons.table.svg())
                      ],
                    ),
                  ),
        
                  for(int i=0; i < posts.length;i++) Post(post: posts[i])
        
                ],
              ),
            ),
          
          ],
        ),
      ),

    );
  }
}