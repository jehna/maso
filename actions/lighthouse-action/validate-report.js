const path = require('path')
const fs = require('fs')

const [, , reportPath] = process.argv
if (!reportPath) {
  throw new Error(
    'No report path specified: Run node validate-report.js path-to-your-lighthouse-report.json'
  )
}

const fullPath = path.resolve(reportPath)
if (!fs.existsSync(fullPath)) {
  throw new Error(`No report found at path ${fullPath}`)
}

const report = require(fullPath)

const categories = Object.values(report.categories)

const failedCategories = categories.filter(category => category.score < 1)
if (failedCategories.length) {
  console.error('Lighthouse test failed')
  console.error('The website did not catch 100/100 at following categories:')
  failedCategories.forEach(category => {
    console.error(
      ` - ${category.title}: ${Math.floor(category.score * 100)}/100`
    )
  })
  process.exit(1)
} else {
  console.log('Lighthouse test ran successfully, 100/100 on each test')
}
