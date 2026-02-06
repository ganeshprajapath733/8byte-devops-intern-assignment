const express = required('eexpress');
const app = express();

app.get('/', (req, res)) => {
	res.send('*byte InternAssignment Successfully Deployed');
});

app.listen(3000, () => { console.log('Server running on port 3000');
});
