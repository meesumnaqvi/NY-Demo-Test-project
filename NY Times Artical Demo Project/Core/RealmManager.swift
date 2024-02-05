//
//  RealmManager.swift
//  NY Times Artical Demo Project
//
//  Created by M Faizan Mujahid on 05/02/2024.
//

import Foundation
import RealmSwift

class RealmManager {
    static func saveToRealm(response: DemoMainViewControllerResponse) {
        let realm = try! Realm()
        let realmResponse = RealmDemoMainViewControllerResponse(from: response)

        try! realm.write {
            realm.add(realmResponse)
            print("****************************** Data Saved ******************************")
        }
    }

    static func fetchFromRealm() -> DemoMainViewControllerResponse? {
        let realm = try! Realm()
        guard let realmResponse = realm.objects(RealmDemoMainViewControllerResponse.self).first else {
            return nil
        }
        print("****************************** Data Retrived ******************************")
        return DemoMainViewControllerResponse(from: realmResponse)
    }

    static func deleteFromRealm() {
        let realm = try! Realm()
        guard let realmResponse = realm.objects(RealmDemoMainViewControllerResponse.self).first else {
            return
        }

        try! realm.write {
            realm.delete(realmResponse)
            print("****************************** Data Deleted ******************************")
        }
    }
}


//{
//    "status": "OK",
//    "copyright": "Copyright (c) 2024 The New York Times Company.  All Rights Reserved.",
//    "num_results": 20,
//    "results": [
//        {
//            "uri": "nyt://article/1289cac4-595f-5f22-b55f-9b2c0ae2844a",
//            "url": "https://www.nytimes.com/2024/02/04/arts/music/grammys-winners-list.html",
//            "id": 100000009289286,
//            "asset_id": 100000009289286,
//            "source": "New York Times",
//            "published_date": "2024-02-04",
//            "updated": "2024-02-05 03:36:45",
//            "section": "Arts",
//            "subsection": "Music",
//            "nytdsection": "arts",
//            "adx_keywords": "Grammy Awards;Music",
//            "column": null,
//            "byline": "",
//            "type": "Article",
//            "title": "Grammys 2024: Winners List",
//            "abstract": "A complete rundown of the artists, albums, songs and videos that took home trophies at the 66th annual awards.",
//            "des_facet": [
//                "Grammy Awards",
//                "Music"
//            ],
//            "org_facet": [],
//            "per_facet": [],
//            "geo_facet": [],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "SZA came into the Grammys with nine nominations, more than any other artist, and left with three wins.",
//                    "copyright": "Chris Pizzello/Invision, via Associated Press",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/multimedia/04grammy-2024-winners-list-sza-swap-lckb/04grammy-2024-winners-list-sza-swap-lckb-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/multimedia/04grammy-2024-winners-list-sza-swap-lckb/04grammy-2024-winners-list-sza-swap-lckb-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/multimedia/04grammy-2024-winners-list-sza-swap-lckb/04grammy-2024-winners-list-sza-swap-lckb-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/05b11025-b65b-59ec-9762-fe8f7b6ba74c",
//            "url": "https://www.nytimes.com/2024/01/30/well/eat/alcohol-gut-health-microbiome.html",
//            "id": 100000009276252,
//            "asset_id": 100000009276252,
//            "source": "New York Times",
//            "published_date": "2024-01-30",
//            "updated": "2024-02-01 12:46:59",
//            "section": "Well",
//            "subsection": "Eat",
//            "nytdsection": "well",
//            "adx_keywords": "Alcoholic Beverages;Digestive Tract;Alcohol Abuse;Research;Diet and Nutrition;Content Type: Service",
//            "column": null,
//            "byline": "By Alice Callahan",
//            "type": "Article",
//            "title": "How Does Alcohol Affect the Gut Microbiome?",
//            "abstract": "Scientists are just beginning to explore the relationship between drinking and the good and bad bacteria in your gut.",
//            "des_facet": [
//                "Alcoholic Beverages",
//                "Digestive Tract",
//                "Alcohol Abuse",
//                "Research",
//                "Diet and Nutrition",
//                "Content Type: Service"
//            ],
//            "org_facet": [],
//            "per_facet": [],
//            "geo_facet": [],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "",
//                    "copyright": "Mojo Wang",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/06/well/30Well-Alcohol-Microbiome/30Well-Alcohol-Microbiome-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/06/well/30Well-Alcohol-Microbiome/30Well-Alcohol-Microbiome-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/06/well/30Well-Alcohol-Microbiome/30Well-Alcohol-Microbiome-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/317f713d-2226-59e8-819d-3e69052d9c14",
//            "url": "https://www.nytimes.com/2024/01/31/magazine/new-college-desantis-florida.html",
//            "id": 100000009282818,
//            "asset_id": 100000009282818,
//            "source": "New York Times",
//            "published_date": "2024-01-31",
//            "updated": "2024-02-02 13:35:34",
//            "section": "Magazine",
//            "subsection": "",
//            "nytdsection": "magazine",
//            "adx_keywords": "College Athletics;Colleges and Universities;Academic Freedom;Politics and Government;Conservatism (US Politics);internal-great-read;internal-sub-only;DeSantis, Ron;New College of Florida;Florida",
//            "column": null,
//            "byline": "By Susan Dominus",
//            "type": "Article",
//            "title": "Recruited to Play Sports, and Win a Culture War",
//            "abstract": "Many New College athletes had no idea they were part of Ron DeSantis’s attack on “woke ideology.” Then the semester began.",
//            "des_facet": [
//                "College Athletics",
//                "Colleges and Universities",
//                "Academic Freedom",
//                "Politics and Government",
//                "Conservatism (US Politics)",
//                "internal-great-read",
//                "internal-sub-only"
//            ],
//            "org_facet": [
//                "New College of Florida"
//            ],
//            "per_facet": [
//                "DeSantis, Ron"
//            ],
//            "geo_facet": [
//                "Florida"
//            ],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "Softball players during a practice in January.",
//                    "copyright": "Victor Llorente for The New York Times",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/magazine/04mag-College-photos/04mag-College-photos-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/magazine/04mag-College-photos/04mag-College-photos-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/magazine/04mag-College-photos/04mag-College-photos-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/d9e9f2ee-3be8-5469-9e23-4e12931ee790",
//            "url": "https://www.nytimes.com/2024/02/02/opinion/transgender-children-gender-dysphoria.html",
//            "id": 100000009287151,
//            "asset_id": 100000009287151,
//            "source": "New York Times",
//            "published_date": "2024-02-02",
//            "updated": "2024-02-03 16:52:32",
//            "section": "Opinion",
//            "subsection": "",
//            "nytdsection": "opinion",
//            "adx_keywords": "Transgender;Mental Health and Disorders;Homosexuality and Bisexuality;Teenagers and Adolescence;Children and Childhood;Psychology and Psychologists;Therapy and Rehabilitation;Suicides and Suicide Attempts;Politics and Government",
//            "column": null,
//            "byline": "By Pamela Paul",
//            "type": "Article",
//            "title": "As Kids, They Thought They Were Trans. They No Longer Do.",
//            "abstract": "Trans activists have pushed an ideological extremism by pressing for an unproven treatment orthodoxy.",
//            "des_facet": [
//                "Transgender",
//                "Mental Health and Disorders",
//                "Homosexuality and Bisexuality",
//                "Teenagers and Adolescence",
//                "Children and Childhood",
//                "Psychology and Psychologists",
//                "Therapy and Rehabilitation",
//                "Suicides and Suicide Attempts",
//                "Politics and Government"
//            ],
//            "org_facet": [],
//            "per_facet": [],
//            "geo_facet": [],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "Grace Powell",
//                    "copyright": "Janick Gilpin for The New York Times",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/02/multimedia/02paul1-chkm/02paul1-chkm-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/02/multimedia/02paul1-chkm/02paul1-chkm-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/02/multimedia/02paul1-chkm/02paul1-chkm-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://interactive/664dc319-cf30-57f2-808b-67dffb44a845",
//            "url": "https://www.nytimes.com/interactive/2024/02/02/briefing/news-quiz-israel-jordan.html",
//            "id": 100000009293049,
//            "asset_id": 100000009293049,
//            "source": "New York Times",
//            "published_date": "2024-02-02",
//            "updated": "2024-02-02 05:03:27",
//            "section": "Briefing",
//            "subsection": "",
//            "nytdsection": "briefing",
//            "adx_keywords": "Content Type: Quiz",
//            "column": null,
//            "byline": "",
//            "type": "Interactive",
//            "title": "The New York Times News Quiz, Feb. 2, 2024",
//            "abstract": "Did you follow the news this week? Take our quiz to see how well you stack up with other Times readers.",
//            "des_facet": [
//                "Content Type: Quiz"
//            ],
//            "org_facet": [],
//            "per_facet": [],
//            "geo_facet": [],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "",
//                    "caption": "",
//                    "copyright": "Pete Marovich for The New York Times",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/01/multimedia/01new-quiz-mayorkas-pvjm/01new-quiz-mayorkas-pvjm-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/01/multimedia/01new-quiz-mayorkas-pvjm/01new-quiz-mayorkas-pvjm-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/01/multimedia/01new-quiz-mayorkas-pvjm/01new-quiz-mayorkas-pvjm-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/3c82063f-eb6f-5041-aa74-4157e9d0bf02",
//            "url": "https://www.nytimes.com/2024/01/31/opinion/covid-2020-recovery-society.html",
//            "id": 100000009280993,
//            "asset_id": 100000009280993,
//            "source": "New York Times",
//            "published_date": "2024-01-31",
//            "updated": "2024-02-03 15:58:49",
//            "section": "Opinion",
//            "subsection": "",
//            "nytdsection": "opinion",
//            "adx_keywords": "Presidential Election of 2024;Quarantine (Life and Culture);Coronavirus (2019-nCoV);Loneliness;United States Politics and Government;United States Economy;Coronavirus Aid, Relief, and Economic Security Act (2020);Two Thousand Twenty;Presti, Daniel;Mac's Public House (Staten Island, NY, Bar);New York City;United States",
//            "column": null,
//            "byline": "By Eric Klinenberg",
//            "type": "Article",
//            "title": "We Were Wrong About What Happened to America in 2020",
//            "abstract": "The answer, only now coming into view, explains why that awful year still has us in its grip.",
//            "des_facet": [
//                "Presidential Election of 2024",
//                "Quarantine (Life and Culture)",
//                "Coronavirus (2019-nCoV)",
//                "Loneliness",
//                "United States Politics and Government",
//                "United States Economy",
//                "Coronavirus Aid, Relief, and Economic Security Act (2020)",
//                "Two Thousand Twenty"
//            ],
//            "org_facet": [
//                "Mac's Public House (Staten Island, NY, Bar)"
//            ],
//            "per_facet": [
//                "Presti, Daniel"
//            ],
//            "geo_facet": [
//                "New York City",
//                "United States"
//            ],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "",
//                    "copyright": "Chris W. Kim",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/opinion/30klinenberg/30klinenberg-thumbStandard-v2.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/opinion/30klinenberg/30klinenberg-mediumThreeByTwo210-v3.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/opinion/30klinenberg/30klinenberg-mediumThreeByTwo440-v3.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://interactive/6392f3ae-4b86-5c6a-bfa2-968b717baac6",
//            "url": "https://www.nytimes.com/interactive/2024/02/01/magazine/israel-founding-palestinian-conflict.html",
//            "id": 100000009289924,
//            "asset_id": 100000009289924,
//            "source": "New York Times",
//            "published_date": "2024-02-01",
//            "updated": "2024-02-02 16:05:50",
//            "section": "Magazine",
//            "subsection": "",
//            "nytdsection": "magazine",
//            "adx_keywords": "Israel-Gaza War (2023- );Palestinians;Jews and Judaism;Holocaust and the Nazi Era;Zionism;Border Barriers;International Relations;Refugees and Displaced Persons;Israel;Great Britain",
//            "column": null,
//            "byline": "By Emily Bazelon",
//            "type": "Interactive",
//            "title": "The Road to 1948, and the Roots of a Perpetual Conflict",
//            "abstract": "How the decisions that led to the founding of Israel have brought unending conflict to the region.",
//            "des_facet": [
//                "Israel-Gaza War (2023- )",
//                "Palestinians",
//                "Jews and Judaism",
//                "Holocaust and the Nazi Era",
//                "Zionism",
//                "Border Barriers",
//                "International Relations",
//                "Refugees and Displaced Persons"
//            ],
//            "org_facet": [],
//            "per_facet": [],
//            "geo_facet": [
//                "Israel",
//                "Great Britain"
//            ],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "",
//                    "caption": "Arab forces attacking the Old City of Jerusalem on June 15, 1948, in the war that followed Israel’s declaration of independence as a Jewish state.",
//                    "copyright": "John Phillips/The LIFE Picture Collection, via Shutterstock",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/magazine/04mag-Roundtable-part5-post1948-05/04mag-Roundtable-part5-post1948-05-thumbStandard-v3.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/magazine/04mag-Roundtable-part5-post1948-05/04mag-Roundtable-part5-post1948-05-mediumThreeByTwo210-v3.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/magazine/04mag-Roundtable-part5-post1948-05/04mag-Roundtable-part5-post1948-05-mediumThreeByTwo440-v3.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/04fa0e90-0467-5baf-9872-52b735f02cb1",
//            "url": "https://www.nytimes.com/2024/02/01/world/europe/eu-hungary-ukraine-fund.html",
//            "id": 100000009292259,
//            "asset_id": 100000009292259,
//            "source": "New York Times",
//            "published_date": "2024-02-01",
//            "updated": "2024-02-02 09:20:38",
//            "section": "World",
//            "subsection": "Europe",
//            "nytdsection": "world",
//            "adx_keywords": "Russian Invasion of Ukraine (2022);Foreign Aid;International Relations;Michel, Charles (1975- );Orban, Viktor;European Union;Hungary;Ukraine;Russia;Europe",
//            "column": null,
//            "byline": "By Matina Stevis-Gridneff, Monika Pronczuk and Jason Horowitz",
//            "type": "Article",
//            "title": "How a Game of Good Cop-Bad Cop Sealed the E.U. Ukraine Fund Deal",
//            "abstract": "Top European leaders coordinated to get the Hungarian prime minister, Viktor Orban, to agree to the 50-billion-euro plan aimed at keeping Ukraine’s economy afloat during the war with Russia.",
//            "des_facet": [
//                "Russian Invasion of Ukraine (2022)",
//                "Foreign Aid",
//                "International Relations"
//            ],
//            "org_facet": [
//                "European Union"
//            ],
//            "per_facet": [
//                "Michel, Charles (1975- )",
//                "Orban, Viktor"
//            ],
//            "geo_facet": [
//                "Hungary",
//                "Ukraine",
//                "Russia",
//                "Europe"
//            ],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "Members of the Ukrainian military training before moving to the front line in the Kharkiv region of Ukraine in December.",
//                    "copyright": "David Guttenfelder for The New York Times",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/01/multimedia/01eu-hungary-sub-01-vwgh/01eu-hungary-sub-01-vwgh-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/01/multimedia/01eu-hungary-sub-01-vwgh/01eu-hungary-sub-01-vwgh-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/01/multimedia/01eu-hungary-sub-01-vwgh/01eu-hungary-sub-01-vwgh-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/597fea6d-1992-528c-ac2a-d18bc83bb2c6",
//            "url": "https://www.nytimes.com/2024/02/01/technology/iphone-mental-health-flip-phone.html",
//            "id": 100000009271461,
//            "asset_id": 100000009271461,
//            "source": "New York Times",
//            "published_date": "2024-02-01",
//            "updated": "2024-02-02 10:13:34",
//            "section": "Technology",
//            "subsection": "",
//            "nytdsection": "technology",
//            "adx_keywords": "Cellular Telephones;Smartphones;Productivity;Work-Life Balance;Content Type: Service;Workplace Environment;Computers and the Internet;Social Media;Fabuwood",
//            "column": null,
//            "byline": "By Kashmir Hill",
//            "type": "Article",
//            "title": "A Practical Guide to Quitting Your Smartphone",
//            "abstract": "Readers who have taken the plunge said it had improved their lives, marriages and mental health, and offered advice to those going without their smartphones for “Flip Phone February.”",
//            "des_facet": [
//                "Cellular Telephones",
//                "Smartphones",
//                "Productivity",
//                "Work-Life Balance",
//                "Content Type: Service",
//                "Workplace Environment",
//                "Computers and the Internet",
//                "Social Media"
//            ],
//            "org_facet": [
//                "Fabuwood"
//            ],
//            "per_facet": [],
//            "geo_facet": [],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "There are challenges to going smartphone-free.",
//                    "copyright": "Brian Fraser for The New York Times",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/01/multimedia/01FlipPhone-01-fkbl/01FlipPhone-01-fkbl-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/01/multimedia/01FlipPhone-01-fkbl/01FlipPhone-01-fkbl-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/01/multimedia/01FlipPhone-01-fkbl/01FlipPhone-01-fkbl-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/9adeb8e9-1bcc-52b4-a97d-7373db080ee7",
//            "url": "https://www.nytimes.com/2024/01/30/us/politics/taylor-swift-travis-kelce-trump.html",
//            "id": 100000009287031,
//            "asset_id": 100000009287031,
//            "source": "New York Times",
//            "published_date": "2024-01-30",
//            "updated": "2024-02-02 13:35:49",
//            "section": "U.S.",
//            "subsection": "Politics",
//            "nytdsection": "u.s.",
//            "adx_keywords": "Conspiracy Theories;Right-Wing Extremism and Alt-Right;Presidential Election of 2024;Pop and Rock Music;Football;Super Bowl;United States Politics and Government;audio-neutral-informative;Swift, Taylor;Kelce, Travis;Trump, Donald J;Biden, Joseph R Jr;Kansas City Chiefs;National Football League;Make America Great Again (MAGA) Inc",
//            "column": null,
//            "byline": "By Jonathan Weisman",
//            "type": "Article",
//            "title": "Taylor Swift, Travis Kelce and a MAGA Meltdown",
//            "abstract": "The fulminations surrounding the world’s biggest pop icon — and girlfriend of Chiefs tight end Travis Kelce — reached the stratosphere after Kansas City made it to the Super Bowl.",
//            "des_facet": [
//                "Conspiracy Theories",
//                "Right-Wing Extremism and Alt-Right",
//                "Presidential Election of 2024",
//                "Pop and Rock Music",
//                "Football",
//                "Super Bowl",
//                "United States Politics and Government",
//                "audio-neutral-informative"
//            ],
//            "org_facet": [
//                "Kansas City Chiefs",
//                "National Football League",
//                "Make America Great Again (MAGA) Inc"
//            ],
//            "per_facet": [
//                "Swift, Taylor",
//                "Kelce, Travis",
//                "Trump, Donald J",
//                "Biden, Joseph R Jr"
//            ],
//            "geo_facet": [],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "Taylor Swift and Travis Kelce after the Chiefs’ victory on Sunday. They are the focus of right-wing vitriol and conspiracy theories.",
//                    "copyright": "Julio Cortez/Associated Press",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/01/29/multimedia/29pol-taylor-topart-ckzf/29pol-taylor-topart-ckzf-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/01/29/multimedia/29pol-taylor-topart-ckzf/29pol-taylor-topart-ckzf-mediumThreeByTwo210-v2.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/01/29/multimedia/29pol-taylor-topart-ckzf/29pol-taylor-topart-ckzf-mediumThreeByTwo440-v2.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/fa9d6d0a-9ced-5fd1-bc12-76d9e6dd4b1d",
//            "url": "https://www.nytimes.com/2024/02/03/opinion/donald-trump-taylor-swift.html",
//            "id": 100000009295570,
//            "asset_id": 100000009295570,
//            "source": "New York Times",
//            "published_date": "2024-02-03",
//            "updated": "2024-02-04 12:09:15",
//            "section": "Opinion",
//            "subsection": "",
//            "nytdsection": "opinion",
//            "adx_keywords": "Presidential Election of 2024;Trump, Donald J;Swift, Taylor",
//            "column": null,
//            "byline": "By Maureen Dowd",
//            "type": "Article",
//            "title": "Inside Trump’s Not-So-Swift Brain",
//            "abstract": "There’s no doubt Donald can’t shake off Taylor.",
//            "des_facet": [
//                "Presidential Election of 2024"
//            ],
//            "org_facet": [],
//            "per_facet": [
//                "Trump, Donald J",
//                "Swift, Taylor"
//            ],
//            "geo_facet": [],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "",
//                    "copyright": "Ed Zurga/Associated Press",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/03/multimedia/03dowd-wcfv/03dowd-wcfv-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/03/multimedia/03dowd-wcfv/03dowd-wcfv-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/03/multimedia/03dowd-wcfv/03dowd-wcfv-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://interactive/01caa587-5937-5657-90e7-dd6b2eecb2e8",
//            "url": "https://www.nytimes.com/interactive/2024/02/02/upshot/flashback.html",
//            "id": 100000009295103,
//            "asset_id": 100000009295103,
//            "source": "New York Times",
//            "published_date": "2024-02-02",
//            "updated": "2024-02-03 11:58:59",
//            "section": "The Upshot",
//            "subsection": "",
//            "nytdsection": "the upshot",
//            "adx_keywords": "internal-paywall-exempt;Content Type: Quiz",
//            "column": null,
//            "byline": "",
//            "type": "Interactive",
//            "title": "Flashback: Your Weekly History Quiz, February 3, 2024",
//            "abstract": "Can you sort 8 historical events?",
//            "des_facet": [
//                "internal-paywall-exempt",
//                "Content Type: Quiz"
//            ],
//            "org_facet": [],
//            "per_facet": [],
//            "geo_facet": [],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "",
//                    "caption": "",
//                    "copyright": "",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/02/upshot/flashback-promo-20240203/flashback-promo-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/02/upshot/flashback-promo-20240203/flashback-promo-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/02/upshot/flashback-promo-20240203/flashback-promo-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/d2e1606a-c189-5108-830f-853b3a06b61d",
//            "url": "https://www.nytimes.com/2024/01/30/theater/chita-rivera-dead.html",
//            "id": 100000006786127,
//            "asset_id": 100000006786127,
//            "source": "New York Times",
//            "published_date": "2024-01-30",
//            "updated": "2024-01-31 14:53:54",
//            "section": "Theater",
//            "subsection": "",
//            "nytdsection": "theater",
//            "adx_keywords": "Deaths (Obituaries);Theater;Actors and Actresses;Theater (Broadway);Rivera, Chita",
//            "column": null,
//            "byline": "By Robert D. McFadden",
//            "type": "Article",
//            "title": "Chita Rivera, Electrifying Star of Broadway and Beyond, Is Dead at 91",
//            "abstract": "Appearing in scores of stage productions, she dazzled audiences for nearly six decades, most memorably starring as Anita in “West Side Story” and Velma Kelly in “Chicago.”",
//            "des_facet": [
//                "Deaths (Obituaries)",
//                "Theater",
//                "Actors and Actresses",
//                "Theater (Broadway)"
//            ],
//            "org_facet": [],
//            "per_facet": [
//                "Rivera, Chita"
//            ],
//            "geo_facet": [],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "Chita Rivera, an original cast member in the Broadway production of “West Side Story,” was a hard-working perfectionist who rarely missed a beat, let alone a performance.",
//                    "copyright": "Associated Press",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2021/02/16/obituaries/Rivera-01/Rivera-01-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2021/02/16/obituaries/Rivera-01/Rivera-01-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2021/02/16/obituaries/Rivera-01/Rivera-01-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/e3121f61-d3d4-5990-93e9-d9c8a8930564",
//            "url": "https://www.nytimes.com/2024/02/03/us/bitcoin-arkansas-noise-pollution.html",
//            "id": 100000009256139,
//            "asset_id": 100000009256139,
//            "source": "New York Times",
//            "published_date": "2024-02-03",
//            "updated": "2024-02-04 23:25:30",
//            "section": "U.S.",
//            "subsection": "",
//            "nytdsection": "u.s.",
//            "adx_keywords": "Bitcoin (Currency);Data Centers;Noise;Pollution;Environment;Law and Legislation;State Legislatures;United States Politics and Government;Suits and Litigation (Civil);Blockchain (Technology);Virtual Currency;Regulation and Deregulation of Industry;Computers and the Internet;internal-truncator;Arkansas",
//            "column": null,
//            "byline": "By Gabriel J.X. Dance",
//            "type": "Article",
//            "title": "Anxiety, Mood Swings and Sleepless Nights: Life Near a Bitcoin Mine",
//            "abstract": "Pushed by an advocacy group, Arkansas became the first state to shield noisy cryptocurrency operators from unhappy neighbors. A furious backlash has some lawmakers considering a statewide ban.",
//            "des_facet": [
//                "Bitcoin (Currency)",
//                "Data Centers",
//                "Noise",
//                "Pollution",
//                "Environment",
//                "Law and Legislation",
//                "State Legislatures",
//                "United States Politics and Government",
//                "Suits and Litigation (Civil)",
//                "Blockchain (Technology)",
//                "Virtual Currency",
//                "Regulation and Deregulation of Industry",
//                "Computers and the Internet",
//                "internal-truncator"
//            ],
//            "org_facet": [],
//            "per_facet": [],
//            "geo_facet": [
//                "Arkansas"
//            ],
//            "media": [],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/e7c10de0-d9c3-542f-976c-f08ebbd917c9",
//            "url": "https://www.nytimes.com/2024/02/04/arts/television/snl-nikki-haley.html",
//            "id": 100000009296449,
//            "asset_id": 100000009296449,
//            "source": "New York Times",
//            "published_date": "2024-02-04",
//            "updated": "2024-02-04 15:27:23",
//            "section": "Arts",
//            "subsection": "Television",
//            "nytdsection": "arts",
//            "adx_keywords": "Comedy and Humor;Presidential Election of 2024;Edebiri, Ayo;Haley, Nikki R",
//            "column": null,
//            "byline": "By Dave Itzkoff",
//            "type": "Article",
//            "title": "S.N.L. Brings Nikki Haley Into the Mix",
//            "abstract": "Ayo Edebiri hosted in a show that focused much of its energy on politics, along with Taylor Swift conspiracy theories and a “Dune” popcorn bucket.",
//            "des_facet": [
//                "Comedy and Humor",
//                "Presidential Election of 2024"
//            ],
//            "org_facet": [],
//            "per_facet": [
//                "Edebiri, Ayo",
//                "Haley, Nikki R"
//            ],
//            "geo_facet": [],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "Nikki Haley played herself on “Saturday Night Live,” and traded barbs with the comedy show’s impersonator of former President Donald J. Trump.",
//                    "copyright": "NBC Universal, via YouTube",
//                    "approved_for_syndication": 0,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/world/04-snl-nh-01/04-snl-nh-01-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/world/04-snl-nh-01/04-snl-nh-01-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/world/04-snl-nh-01/04-snl-nh-01-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/e69a08ad-f334-57dc-99b5-ab2838f46503",
//            "url": "https://www.nytimes.com/2024/02/02/nyregion/flaco-owl-central-park-zoo.html",
//            "id": 100000009272938,
//            "asset_id": 100000009272938,
//            "source": "New York Times",
//            "published_date": "2024-02-02",
//            "updated": "2024-02-04 15:50:28",
//            "section": "New York",
//            "subsection": "",
//            "nytdsection": "new york",
//            "adx_keywords": "Owls;Animal Behavior;Vandalism;Central Park Zoo;Wildlife Conservation Society;Central Park (Manhattan, NY);Manhattan (NYC)",
//            "column": null,
//            "byline": "By Ed Shanahan",
//            "type": "Article",
//            "title": "The Year Flaco the Owl Roamed Free",
//            "abstract": "He fled the Central Park Zoo and made the rest of Manhattan his new home. What has he been up to?",
//            "des_facet": [
//                "Owls",
//                "Animal Behavior",
//                "Vandalism"
//            ],
//            "org_facet": [
//                "Central Park Zoo",
//                "Wildlife Conservation Society"
//            ],
//            "per_facet": [],
//            "geo_facet": [
//                "Central Park (Manhattan, NY)",
//                "Manhattan (NYC)"
//            ],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "This is Flaco. He used to live in the Central Park Zoo.",
//                    "copyright": "David Lei",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/nyregion/04flaco-year-scrolly-1-1/02flaco-year-scrolly-1-1-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/nyregion/04flaco-year-scrolly-1-1/02flaco-year-scrolly-1-1-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/nyregion/04flaco-year-scrolly-1-1/02flaco-year-scrolly-1-1-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/5ae869d3-613a-5680-8f90-314d3f66f448",
//            "url": "https://www.nytimes.com/2024/01/31/opinion/biden-iran-israel.html",
//            "id": 100000009291139,
//            "asset_id": 100000009291139,
//            "source": "New York Times",
//            "published_date": "2024-01-31",
//            "updated": "2024-02-02 12:34:01",
//            "section": "Opinion",
//            "subsection": "",
//            "nytdsection": "opinion",
//            "adx_keywords": "Palestinians;Israel-Gaza War (2023- );Terrorism;United States International Relations;Biden, Joseph R Jr;Netanyahu, Benjamin;Hamas;Iran;Gaza Strip;Israel;Jordan;Middle East;Saudi Arabia",
//            "column": null,
//            "byline": "By Thomas L. Friedman",
//            "type": "Article",
//            "title": "A Biden Doctrine for the Middle East Is Forming. And It’s Big.",
//            "abstract": "America’s approach to Iran, a Palestinian state and Saudi Arabia are at the heart of a possible strategic realignment in the Middle East.",
//            "des_facet": [
//                "Palestinians",
//                "Israel-Gaza War (2023- )",
//                "Terrorism",
//                "United States International Relations"
//            ],
//            "org_facet": [
//                "Hamas"
//            ],
//            "per_facet": [
//                "Biden, Joseph R Jr",
//                "Netanyahu, Benjamin"
//            ],
//            "geo_facet": [
//                "Iran",
//                "Gaza Strip",
//                "Israel",
//                "Jordan",
//                "Middle East",
//                "Saudi Arabia"
//            ],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "",
//                    "copyright": "Mark Peterson for The New York Times",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/02/multimedia/31friedman-cjkz/31friedman-cjkz-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/02/multimedia/31friedman-cjkz/31friedman-cjkz-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/02/multimedia/31friedman-cjkz/31friedman-cjkz-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/906304ea-dfe7-57b6-a7c0-809e7b8f7187",
//            "url": "https://www.nytimes.com/2024/01/29/world/europe/princess-kate-middleton-abdominal-surgery.html",
//            "id": 100000009282419,
//            "asset_id": 100000009282419,
//            "source": "New York Times",
//            "published_date": "2024-01-29",
//            "updated": "2024-01-29 10:28:12",
//            "section": "World",
//            "subsection": "Europe",
//            "nytdsection": "world",
//            "adx_keywords": "Surgery and Surgeons;Royal Families;Catherine, Duchess of Cambridge;Charles III, King of the United Kingdom;William, Duke of Cambridge;Kensington Palace;Great Britain;London (England)",
//            "column": null,
//            "byline": "By Mark Landler",
//            "type": "Article",
//            "title": "Princess of Wales Returns Home From Hospital After Abdominal Surgery",
//            "abstract": "The sudden hospitalization of Catherine, the wife of Prince William, in mid-January, surprised royal watchers in Britain. She will convalesce for two to three months.",
//            "des_facet": [
//                "Surgery and Surgeons",
//                "Royal Families"
//            ],
//            "org_facet": [
//                "Kensington Palace"
//            ],
//            "per_facet": [
//                "Catherine, Duchess of Cambridge",
//                "Charles III, King of the United Kingdom",
//                "William, Duke of Cambridge"
//            ],
//            "geo_facet": [
//                "Great Britain",
//                "London (England)"
//            ],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "Catherine, Princess of Wales, at Westminster Abbey in London in December.",
//                    "copyright": "Pool photo by Chris Jackson",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/01/26/multimedia/00uk-catherine-surgery-01-tbpq/00uk-catherine-surgery-01-tbpq-thumbStandard.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/01/26/multimedia/00uk-catherine-surgery-01-tbpq/00uk-catherine-surgery-01-tbpq-mediumThreeByTwo210.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/01/26/multimedia/00uk-catherine-surgery-01-tbpq/00uk-catherine-surgery-01-tbpq-mediumThreeByTwo440.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/eefb2184-a6b4-5503-821f-1c272c1e8270",
//            "url": "https://www.nytimes.com/2024/02/04/style/grammys-red-carpet-photos.html",
//            "id": 100000009290995,
//            "asset_id": 100000009290995,
//            "source": "New York Times",
//            "published_date": "2024-02-04",
//            "updated": "2024-02-05 01:03:32",
//            "section": "Style",
//            "subsection": "",
//            "nytdsection": "style",
//            "adx_keywords": "Grammy Awards;Pop and Rock Music;Fashion and Apparel",
//            "column": null,
//            "byline": "By The Styles Desk",
//            "type": "Article",
//            "title": "Grammys 2024 Red Carpet: How Music’s Biggest Stars Made Their Entrance",
//            "abstract": "See what nominees and performers including Taylor Swift, Olivia Rodrigo, Dua Lipa and Ice Spice wore to arrive for the ceremony.",
//            "des_facet": [
//                "Grammy Awards",
//                "Pop and Rock Music",
//                "Fashion and Apparel"
//            ],
//            "org_facet": [],
//            "per_facet": [],
//            "geo_facet": [],
//            "media": [
//                {
//                    "type": "image",
//                    "subtype": "photo",
//                    "caption": "Taylor Swift, winner of the Grammy for album of the year, made an entrance in Schiaparelli.",
//                    "copyright": "Frazer Harrison/Getty Images",
//                    "approved_for_syndication": 1,
//                    "media-metadata": [
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/multimedia/04grammys-swift-bfkc/04grammys-swift-bfkc-thumbStandard-v2.jpg",
//                            "format": "Standard Thumbnail",
//                            "height": 75,
//                            "width": 75
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/multimedia/04grammys-swift-bfkc/04grammys-swift-bfkc-mediumThreeByTwo210-v2.jpg",
//                            "format": "mediumThreeByTwo210",
//                            "height": 140,
//                            "width": 210
//                        },
//                        {
//                            "url": "https://static01.nyt.com/images/2024/02/04/multimedia/04grammys-swift-bfkc/04grammys-swift-bfkc-mediumThreeByTwo440-v2.jpg",
//                            "format": "mediumThreeByTwo440",
//                            "height": 293,
//                            "width": 440
//                        }
//                    ]
//                }
//            ],
//            "eta_id": 0
//        },
//        {
//            "uri": "nyt://article/a1b21b46-7038-55b1-8fb3-b9326dc02d74",
//            "url": "https://www.nytimes.com/2024/02/01/science/dogs-longevity-health.html",
//            "id": 100000009289725,
//            "asset_id": 100000009289725,
//            "source": "New York Times",
//            "published_date": "2024-02-01",
//            "updated": "2024-02-02 09:35:30",
//            "section": "Science",
//            "subsection": "",
//            "nytdsection": "science",
//            "adx_keywords": "your-feed-science;internal-truncator;internal-storyline-inline-no;your-feed-animals;Dogs;Pets;Longevity;Research;Nose;Scientific Reports (Journal);Great Britain",
//            "column": null,
//            "byline": "By Emily Anthes",
//            "type": "Article",
//            "title": "The Dogs That Live Longest, by a Nose",
//            "abstract": "Small dogs with prominent noses live longer than bigger, flat-faced canines, a new study suggests.",
//            "des_facet": [
//                "your-feed-science",
//                "internal-truncator",
//                "internal-storyline-inline-no",
//                "your-feed-animals",
//                "Dogs",
//                "Pets",
//                "Longevity",
//                "Research",
//                "Nose"
//            ],
//            "org_facet": [
//                "Scientific Reports (Journal)"
//            ],
//            "per_facet": [],
//            "geo_facet": [
//                "Great Britain"
//            ],
//            "media": [],
//            "eta_id": 0
//        }
//    ]
//}
