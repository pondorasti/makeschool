module.exports = (markdown, options) => {
    return new Promise((resolve, reject) => {

        lines = markdown.split('\n');
        new_lines = [];

        let in_code_block = false

        let last_header_seen = ''

        for (let i = 0; i < lines.length; i++) {
            let line = lines[i];
            if (line.substring(0, 3) == '```') {
                in_code_block = !in_code_block;
            }
            if (line.substring(0, 9).toUpperCase() == '### BREAK') { // special case for break
                new_lines.push('\n<!-- > -->\n');
                new_lines.push(line);
                new_lines.push('<!-- .element: class="break" -->');
                new_lines.push('<!-- .slide: data-background="#087CB8" -->');
            } else if (line.substring(0, 3) == '###') {
                last_header_seen = line;
                new_lines.push('\n<!-- v -->\n');
                new_lines.push(line);
            } else if (line.substring(0, 3) == '## ') {
                new_lines.push('\n<!-- > -->\n');
                new_lines.push(line);
            } else if (line == '<!-- br -->') {
                new_lines.push('\n<!-- v -->\n');
                new_lines.push(last_header_seen);
            } else if (line.charAt(0) == '^') {
                new_lines.push(line.substring(1));
            } else if (line != '' && line.substring(0,2) != '<!' && !in_code_block && i > 0) {
                new_lines.push(line);
                new_lines.push('<!-- .element: class="fragment" -->');
            } else {
                new_lines.push(line);
            }
        }
        // console.log(new_lines.join('\n'));
        return resolve(new_lines.join('\n'));
    });
  };