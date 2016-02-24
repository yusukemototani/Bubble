if Category.count == 0
    Category.create([
        {name: 'Asia'},
        {name: 'Europe'},
        {name: 'North America'},
        {name: 'South America'},
        {name: 'Africa'},
        {name: 'Oceania'},
        {name: 'Another'}
    ])
end