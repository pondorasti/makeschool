//
//  Unsplash.swift
//  GCDAsyncImage
//
//  Created by Chase Wang on 2/24/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation

struct Unsplash {
    static let defaultImageURLs: [URL] = {
        return imageURLStrings.flatMap { URL(string: $0) }
    }()
    
    static let imageURLStrings = ["https://images.unsplash.com/photo-1474693220100-7cddec4346f6?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;s=b21e6c4da6e691d831533e7b1ad2fe67",
        "https://images.unsplash.com/photo-1481897083252-7024610f34d0?dpr=2&auto=format&fit=crop&w=1199&h=743&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1481018685621-0c069c99fce2?dpr=2&auto=format&fit=crop&w=1199&h=899&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1483299765882-4013dbca7ff7?dpr=2&auto=format&fit=crop&w=1199&h=749&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1481204287293-36160be24f29?dpr=2&auto=format&fit=crop&w=1199&h=899&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1482957701449-f792f1f41506?dpr=2&auto=format&fit=crop&w=1199&h=768&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1473181488821-2d23949a045a?dpr=2&auto=format&fit=crop&w=1199&h=799&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1484976063837-eab657a7aca7?dpr=2&auto=format&fit=crop&w=1199&h=799&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1484199383121-dfa3c30608cd?dpr=2&auto=format&fit=crop&w=1199&h=674&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1484599379766-aa5e119b0066?dpr=2&auto=format&fit=crop&w=1199&h=799&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/uploads/1413142095961484763cf/d141726c?dpr=2&auto=format&fit=crop&w=1199&h=799&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1422360902398-0a91ff2c1a1f?dpr=2&auto=format&fit=crop&w=1199&h=838&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1429081172764-c0ee67ab9afd?dpr=2&auto=format&fit=crop&w=1199&h=741&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1463194537334-3940784aa69a?dpr=2&auto=format&fit=crop&w=1199&h=800&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1484851050019-ca9daf7736fb?dpr=2&auto=format&fit=crop&w=1199&h=800&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1485795959911-ea5ebf41b6ae?dpr=2&auto=format&fit=crop&w=1199&h=790&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1463432786691-8ec0615f2dfe?dpr=2&auto=format&fit=crop&w=1199&h=799&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1484100356142-db6ab6244067?dpr=2&auto=format&fit=crop&w=1199&h=907&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1483125078247-1a358ff363d3?dpr=2&auto=format&fit=crop&w=1199&h=799&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1484244233201-29892afe6a2c?dpr=2&auto=format&fit=crop&w=1199&h=800&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1446860597196-9355ec2ff8c8?dpr=2&auto=format&fit=crop&w=1199&h=799&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1483462926982-fa6d323908bc?dpr=2&auto=format&fit=crop&w=1199&h=800&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1434144893279-2a9fc14e9337?dpr=2&auto=format&fit=crop&w=1199&h=737&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1485321586038-4cc99992a06f?dpr=2&auto=format&fit=crop&w=1199&h=799&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1471623432079-b009d30b6729?dpr=2&auto=format&fit=crop&w=1199&h=799&q=80&cs=tinysrgb&crop=",
        "https://images.unsplash.com/photo-1485466799797-74ecb5ef351b?dpr=2&auto=format&fit=crop&w=1199&h=799&q=80&cs=tinysrgb&crop="]
}
