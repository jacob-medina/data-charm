const { table } = require('table');

class Table {
    constructor(data) {
        this.columnNames = Object.keys(data[0]).map(name => Table.titleCase(name));
        this.data = data;
        this.array = [this.columnNames];
        this.data.forEach((row, index) => 
            this.array.push(Object.values(this.data[index]))
        );
    }

    render() {
        return table(this.array);
    }

    static titleCase(string) {
        return string.split(' ')
            .map(word => 
                word.charAt(0).toUpperCase() + word.slice(1))
            .join(' ');
    }
}

module.exports = Table;