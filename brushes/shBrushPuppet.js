/**
 * Puppet Brush for SyntaxHighlighter (http://alexgorbatchev.com/SyntaxHighlighter)
 *
 * @copyright
 * Copyright (C) 2017 Kurt Klinner. All rights reserved.
 *
 * @version
 * 0.1 (Oct 2017)
 *
 * @license
 * The shBrushPuppet.js extension for SyntaxHighLighter is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * shBrushPuppet.js is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */
;(function()
{
    // CommonJS
    SyntaxHighlighter = SyntaxHighlighter || (typeof(require) != 'undefined' ? SyntaxHighlighter = require('shCore').SyntaxHighlighter : null);

    function Brush()
    {
        //define your color codes
        var colorCodes = new Object();
        colorCodes['keywords']  = 'color2';
        colorCodes['resources'] = 'color2';
        colorCodes['variables'] = 'color1';
        colorCodes['operator']  = 'color1';
        colorCodes['functions'] = 'color1';
        colorCodes['brackets']  = 'color1';
        colorCodes['operator']  = 'color1';
        colorCodes['values']    = 'string';
        colorCodes['comments']  = 'comments';

        var keywords = 'class define site node include import inherits case if else in and elsif default or and' +
                       'application attr case class consumes default define else elsif environment false function' +
                       'if import in inherits node or private produces true type undef unless any array boolean' +
                       'catalogentry collection callable data default enum float hash integer numeric optional' +
                       'pattern resource runtime scalar string struct tuple type undef variant';

        var builtin  = 'action augeas burst chain computer cron destination dport exec ' +
                       'file filebucket group host icmp iniface interface jump k5login limit log_level ' +
                       'log_prefix macauthorization mailalias maillist mcx mount nagios_command ' +
                       'nagios_contact nagios_contactgroup nagios_host nagios_hostdependency ' +
                       'nagios_hostescalation nagios_hostextinfo nagios_hostgroup nagios_service ' +
                       'nagios_servicedependency nagios_serviceescalation nagios_serviceextinfo ' +
                       'nagios_servicegroup nagios_timeperiod name notify outiface package proto reject ' +
                       'resources router schedule scheduled_task selboolean selmodule service source ' +
                       'sport ssh_authorized_key sshkey stage state table tidy todest toports tosource ' +
                       'user vlan yumrepo zfs zone zpool';

        var funcs    = 'alert assert_type binary_file break contain create_resources crit debug defined dig digest each' +
                       'emerg epp err fail file filter find_file fqdn_rand generate hiera hiera_array hiera_hash hiera_include' +
                       'include info inline_epp inline_template lest lookup map match md5 new next notice realize reduce regsubst' +
                       'require return reverse_each scanf sha1 shellquote slice split sprintf step strftime tag tagged template then type versioncmp warning with';

        function matchCustomPattern(regExpPosition, cssStyle)
        {
            return function(regExpMatch, regExpInfo)
            {
                var regExpMatcher = SyntaxHighlighter.Match;

                return [new regExpMatcher(regExpMatch[regExpPosition], regExpMatch.index + regExpMatch[0].indexOf(regExpMatch[regExpPosition]), cssStyle)]
            }
        }

        this.regexList = [
            //Comments
            { regex: new RegExp('#[^!].*$', 'gm'),                    css: colorCodes['comments'] },
		      	{ regex: new RegExp('\\/\\*([^\\*][\\s\\S]*)?\\*\\/','gm'),						css: 'comments' },
            { regex: SyntaxHighlighter.regexLib.singleLineCComments,  css: colorCodes['comments'] },
            { regex: SyntaxHighlighter.regexLib.multiLineCComments,  css: colorCodes['comments'] },

            //Resources
            { regex: new RegExp('^\\s *([:]*[a-z][a-zA-Z0-9_:-]*)\\s+{', 'gm'), func: matchCustomPattern(1, colorCodes['resources']) },

            //Variables, Values, => operator & Strings
            { regex: new RegExp('^\\s *([a-z][a-zA-Z0-9_:-]*)\\s+=', 'gm'), func: matchCustomPattern(1, colorCodes['variables']) },
            { regex: new RegExp('=(&gt;|>)\\s*([a-z][a-zA-Z0-9_:-]*)\\s*', 'gm'), func: matchCustomPattern(2, colorCodes['values']) },
            { regex: new RegExp('(=&gt;|=>)', 'gm'), func: matchCustomPattern(1, colorCodes['operator']) },
            { regex: SyntaxHighlighter.regexLib.doubleQuotedString, css: colorCodes['values'] },
            { regex: SyntaxHighlighter.regexLib.singleQuotedString, css: colorCodes['values'] },

            { regex: new RegExp('({|})', 'gm'), func: matchCustomPattern(1, colorCodes['brackets']) },
            { regex: new RegExp(this.getKeywords(funcs), 'gmi'),    css: colorCodes['functions'] },
            { regex: new RegExp(this.getKeywords(keywords), 'gm'),  css: colorCodes['keywords'] }
        ];
    }

    Brush.prototype = new SyntaxHighlighter.Highlighter();
    Brush.aliases       = ['puppet', 'pp'];

    SyntaxHighlighter.brushes.Puppet = Brush;

    // CommonJS
    typeof(exports) != 'undefined' ? exports.Brush = Brush : null;
})();
