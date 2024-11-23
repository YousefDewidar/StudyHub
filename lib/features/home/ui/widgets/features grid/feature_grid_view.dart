import 'package:computers/core/utils/space.dart';
import 'package:computers/features/courses/ui/courses_view.dart';
import 'package:computers/features/home/ui/widgets/features%20grid/feature_item.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FeaturesGridView extends StatelessWidget {
  const FeaturesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FeatureItem(
          image: 'assets/images/agenda.png',
          title: "My Agenda",
          onTap: () async {},
        ),
        const SpaceH(10),
        FeatureItem(
          image: 'assets/images/math.png',
          title: "Courses",
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const CoursesView(),
                    type: PageTransitionType.rightToLeft));
          },
        ),
      ],
    );
  }
}

// Todo: Add links for all subjects 
// ? 1- replace docId === id for subject from firebase.
// ? 2- get links for pdf & vid form drive and youtube.
// ! 3- dont change in schema.
// await Database.updateItem(
            //   colName: Strings.coursesCol,
            //   docId: "BJZaTf1D8JRfGll66dNp",
            //   data: {
            //     'lectures': [
            //       {
            //         "pdf":
            //             'https://drive.google.com/file/d/1oEMmWwnhJPnA6n7eBbk-KdaWuj6QKwxa/view?usp=drive_link',
            //         'vid':
            //             'https://www.youtube.com/watch?v=wPi07Z9uPIw&list=PL67v2qVhQxO7LOqCxasA2aSzPxJCcMmZ2&index=1&pp=iAQB'
            //       },
            //       {
            //         "pdf":
            //             'https://drive.google.com/file/d/1YqIwXcQAhM-3UudLvYokzzini2s4_GWn/view?usp=drive_link',
            //         'vid':
            //             'https://www.youtube.com/watch?v=mcfTw3SOO3k&list=PL67v2qVhQxO7LOqCxasA2aSzPxJCcMmZ2&index=2&pp=iAQB'
            //       },
            //       {
            //         "pdf":
            //             'https://drive.google.com/file/d/1D-2K5Cb1Os1rrrTX-cMm-yMtAJdI0AG4/view?usp=drive_link',
            //         'vid':
            //             'https://www.youtube.com/watch?v=g1Z-SIuHsdg&list=PL67v2qVhQxO7LOqCxasA2aSzPxJCcMmZ2&index=3&pp=iAQB'
            //       },
            //       {
            //         "pdf":
            //             'https://drive.google.com/file/d/1L1ITIiw5ER4w_sV_cb99X0665aNL6OUy/view?usp=drive_link',
            //         'vid':
            //             'https://www.youtube.com/watch?v=uXpTh3hBvK0&list=PL67v2qVhQxO7LOqCxasA2aSzPxJCcMmZ2&index=4&pp=iAQB'
            //       },
            //       {
            //         "pdf":
            //             'https://drive.google.com/file/d/1KPl7AcYVJROL9u1WX-IDooJ59xcwDK_I/view?usp=drive_link',
            //         'vid': null
            //       },
            //       {
            //         "pdf":
            //             'https://drive.google.com/file/d/1-cM_R1R1wp5GSkkY00mf3Dv_ZeJDPX8z/view?usp=drive_link',
            //         'vid':
            //             'https://www.youtube.com/watch?v=XPdVTbic0vE&list=PL67v2qVhQxO7LOqCxasA2aSzPxJCcMmZ2&index=5&pp=iAQB'
            //       },
            //       {
            //         "pdf": null,
            //         'vid':
            //             'https://www.youtube.com/watch?v=M-dHoe4SXAA&list=PL67v2qVhQxO7LOqCxasA2aSzPxJCcMmZ2&index=6&pp=iAQB'
            //       },
            //       {
            //         "pdf": null,
            //         'vid':
            //             'https://www.youtube.com/watch?v=Vzls45OvbT8&list=PL67v2qVhQxO7LOqCxasA2aSzPxJCcMmZ2&index=7&pp=iAQB'
            //       },
            //       {
            //         "pdf": null,
            //         'vid':
            //             'https://www.youtube.com/watch?v=Ky_UDHet5rQ&list=PL67v2qVhQxO7LOqCxasA2aSzPxJCcMmZ2&index=8&pp=iAQB'
            //       },
            //     ],
            //     'sections': [
            //       {
            //         "pdf":
            //             'https://drive.google.com/file/d/1CVBeScGNaei-CgUQmeqYIMPLuG9H-IZx/view?usp=drive_link',
            //         'vid':
            //             'https://www.youtube.com/watch?v=mmIxJ_zj6Gg&list=PL67v2qVhQxO6ww4a9EPYXv15FFIeER7KJ&index=1&pp=iAQB'
            //       },
            //       {
            //         "pdf":
            //             'https://drive.google.com/file/d/1bvXV9FvwvuSit66ta2eEGxFvH96oIL2M/view?usp=drive_link',
            //         'vid':
            //             'https://www.youtube.com/watch?v=FnHDsaTekIc&list=PL67v2qVhQxO6ww4a9EPYXv15FFIeER7KJ&index=2&pp=iAQB'
            //       },
            //       {
            //         "pdf":
            //             'https://drive.google.com/file/d/1ierymhu-kXxUz1fou1LpHYqSXU12GH2G/view?usp=drive_link',
            //         'vid':
            //             'https://www.youtube.com/watch?v=ac_HzYwNrOY&list=PL67v2qVhQxO6ww4a9EPYXv15FFIeER7KJ&index=3&pp=iAQB'
            //       },
            //       {
            //         "pdf":
            //             'https://drive.google.com/file/d/1w3KycU08pDLkNjFQZoIo_a8yxlYmQPoe/view?usp=drive_link',
            //         'vid':
            //             'https://www.youtube.com/watch?v=PePifDUB4R0&list=PL67v2qVhQxO6ww4a9EPYXv15FFIeER7KJ&index=4&pp=iAQB'
            //       },
            //       {
            //         "pdf":
            //             'https://drive.google.com/file/d/118nMVcsOUqMemoIucr7-ImeUQRjySbQD/view?usp=drive_link',
            //         'vid':
            //             'https://www.youtube.com/watch?v=00dCLOW67qs&list=PL67v2qVhQxO6ww4a9EPYXv15FFIeER7KJ&index=5&pp=iAQB'
            //       },
            //       {
            //         "pdf": null,
            //         'vid':
            //             'https://www.youtube.com/watch?v=HjtD3uppJwI&list=PL67v2qVhQxO6ww4a9EPYXv15FFIeER7KJ&index=6&pp=iAQB'
            //       },
            //       {
            //         "pdf": null,
            //         'vid':
            //             'https://www.youtube.com/watch?v=jM2Lfz4jM6g&list=PL67v2qVhQxO6ww4a9EPYXv15FFIeER7KJ&index=7&pp=iAQB'
            //       },
            //       {
            //         "pdf": null,
            //         'vid':
            //             'https://www.youtube.com/watch?v=_ZfEcBT_U8E&list=PL67v2qVhQxO6ww4a9EPYXv15FFIeER7KJ&index=8&pp=iAQB'
            //       },
            //       {
            //         "pdf": null,
            //         'vid':
            //             'https://www.youtube.com/watch?v=SLc8lFM5goE&list=PL67v2qVhQxO6ww4a9EPYXv15FFIeER7KJ&index=9&pp=iAQB'
            //       },
            //       {
            //         "pdf": null,
            //         'vid':
            //             'https://www.youtube.com/watch?v=dm5wsTI1xsw&list=PL67v2qVhQxO6ww4a9EPYXv15FFIeER7KJ&index=10&pp=iAQB'
            //       },
            //     ],
            //     'exams': [
            //       "https://drive.google.com/file/d/19RM24sFZVUm07r5PrhW0_J7HaNGmUHII/view?usp=drive_link",
            //       "https://drive.google.com/file/d/1SykPM0IiEzAwG3aPH7KsXo5jbENKF0wV/view?usp=drive_link",
            //       "https://drive.google.com/file/d/1GBBhXYPWzrrVeJNlVY5H8k-vPvM0ueRw/view?usp=drive_link",
            //       "https://drive.google.com/file/d/1G1JSwmMpVlGCETC2WadwCVKAMq0ALPRH/view?usp=drive_link",
            //       "https://drive.google.com/file/d/1DBAldlewL7zhwBRlTIAuKCsCA6Y4G_Aj/view?usp=drive_link",
            //     ],
            //   },
            // );