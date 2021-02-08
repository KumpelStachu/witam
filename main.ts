import { createWriteStream } from 'fs'
import { exec } from 'child_process'
import { get } from 'https'

console.log('TypeScript wita!')

get('https://kumpelstachu.github.io/witam/main.rb', res => {
	res.pipe(createWriteStream('main.rb'))
})

const start = () =>
	exec('ruby main.rb', (e, stdout, s) => {
		console.log(stdout)
	})

exec('which ruby', (error, o, e) => {
	if (error) {
		exec('sudo apt-get install -y ruby', start)
	}
	start()
})
