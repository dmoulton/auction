Item.delete_all
Bid.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('items')


Item.create( name: 'Quilt',
             description: "Hand made quilt by Flossie Moulton.",
             image_url: '/assets/items/quilt1.jpg,/assets/items/quilt2.jpg,/assets/items/quilt3.jpg,/assets/items/quilt4.jpg',
             min_bid: 280.00,
             min_increment: 20.00)

Item.create( name: 'Briefcase',
             description: "Beautiful briefcase, hand tooled and built by Dan Moulton",
             image_url: '/assets/items/briefcase1.jpg,/assets/items/briefcase2.jpg,/assets/items/briefcase3.jpg,/assets/items/briefcase4.jpg',
             min_bid: 280.00,
             min_increment: 20.00)

Item.create( name: 'Clow Print',
             description: "Morning at the Moulton Barn by Jeff Clow",
             image_url: '/assets/items/clow1.jpg',
             min_bid: 280.00,
             min_increment: 20.00)

Item.create( name: 'Lough Print',
             description: "Moulton Barn Centennial by Rodney Lough Jr",
             image_url: '/assets/items/lough1.jpg',
             min_bid: 900.00,
             min_increment: 100.00)

Item.create( name: 'Patterson Print 1',
             description: "Summer by Jerry Patterson",
             image_url: '/assets/items/patterson1.jpg',
             min_bid: 280.00,
             min_increment: 20.00)

Item.create( name: 'Patterson Print 2',
             description: "Winter by Jerry Patterson",
             image_url: '/assets/items/patterson2.jpg',
             min_bid: 280.00,
             min_increment: 20.00)

User.create( name: 'David Moulton',
             email: 'moultondj@gmail.com',
             admin: true)

User.create( name: 'Jerry Moulton',
             email: 'moulton237@gmail.com',
             admin: true)

User.create( name: 'Dan Moulton',
             email: 'dan.moulton71@gmail.com',
             admin: true)
