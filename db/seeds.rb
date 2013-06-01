Item.delete_all
Bid.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('items')


Item.create( name: 'Quilt',
             artist: "Flossie Moulton",
             size: "Queen Size",
             description: "Hand made quilt",
             image_url: '/assets/items/quilt5.jpg,/assets/items/quilt6.jpg,/assets/items/quilt7.jpg,/assets/items/quilt8.jpg,,/assets/items/quilt9.jpg,/assets/items/quilt10.jpg',
             min_bid: 580.00,
             min_increment: 20.00,
             order: 6)

Item.create( name: 'Briefcase',
             artist: "Dan Moulton",
             size: "",
             description: "Beautiful Hand tooled Briefcase",
             image_url: '/assets/items/briefcase1.jpg,/assets/items/briefcase2.jpg,/assets/items/briefcase3.jpg,/assets/items/briefcase4.jpg,/assets/items/briefcase5.jpg,/assets/items/briefcase6.jpg',
             min_bid: 280.00,
             min_increment: 20.00,
             order: 5)

Item.create( name: 'Clow Print',
             artist: "Jeff Clow",
             size: "16X32 Framed",
             description: "Morning at the Moulton Barn",
             image_url: '/assets/items/clow1.jpg',
             min_bid: 280.00,
             min_increment: 20.00,
             order: 2)

Item.create( name: 'Lough Print',
             artist: "Rodney Lough, Jr",
             size: "25X66 Framed",
             description: "Moulton Barn Centennial",
             image_url: '/assets/items/lough1.jpg',
             min_bid: 900.00,
             min_increment: 100.00,
             order: 1)

Item.create( name: 'Patterson Print 1',
             artist: "Jerry Patterson",
             size: "24X32 Unframed",
             description: "Summer",
             image_url: '/assets/items/patterson1.jpg',
             min_bid: 280.00,
             min_increment: 20.00,
             order: 3)

Item.create( name: 'Patterson Print 2',
             artist: "Jerry Patterson",
             size: "24X32 Unframed",
             description: "Winter",
             image_url: '/assets/items/patterson2.jpg',
             min_bid: 280.00,
             min_increment: 20.00,
             order: 4)

User.create( name: 'David Moulton',
             email: 'moultondj@gmail.com',
             admin: true)

User.create( name: 'Jerry Moulton',
             email: 'moulton237@gmail.com',
             admin: true)

User.create( name: 'Dan Moulton',
             email: 'dan.moulton71@gmail.com',
             admin: true)
