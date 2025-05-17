/** @type {import('prettier').Config} */
module.exports = {
	useTabs: true,
	importOrder: [
		"^@angular/(.*)$",
		"^@domain/(.*)$",
		"^@xpack/(.*)$",
		"^@control-panel/(.*)$",
		"^@website/(.*)$",
		"^@fortawesome/(.*)$",
		"^[./]",
	],
	importOrderSeparation: true,
	importOrderSortSpecifiers: true,
	importOrderParserPlugins: ["typescript", "decorators-legacy"],
	overrides: [
		{
			files: ["**/*.css", "**/*.scss"],
			options: {
				singleQuote: true,
			},
		},
		{
			files: "*.html",
			options: {
				parser: "angular",
			},
		},
	],
	plugins: [
		"@trivago/prettier-plugin-sort-imports",
		"prettier-plugin-organize-attributes",
		"prettier-plugin-tailwindcss",
	],
	tailwindConfig: "./tailwind.preset.js",
	attributeGroups: [
		"$ANGULAR_STRUCTURAL_DIRECTIVE",
		"$ANGULAR_OUTPUT",
		"$ANGULAR_TWO_WAY_BINDING",
		"$ANGULAR_INPUT",
	],
};
