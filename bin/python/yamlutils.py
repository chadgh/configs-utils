import yaml

class OrderedYaml(object):
    """Reads and writes yaml in an ordered manner."""
    def __init__(self, filename=None):
        super(OrderedYaml, self).__init__()
        self.yamlFile = filename
        self.yamlObj = {}
        self.yamlObjOrder = {}

    def _getYamlOrder(self, contents):
        """Return the order of the yaml object keys."""
        order = []
        for line in contents:
            key = line.split(':')[0]
            if not key.startswith(' '):
                order.append(key)
        return order

    def load(self, filename=None):
        """Load a yaml file."""
        if filename is not None:
            self.yamlFile = filename
        if self.yamlFile is None:
            raise Exception("No file to read from.")
        with open(self.yamlFile, 'r') as contents:
            contents2 = copy(contents)
            self.yamlObj = yaml.load(contents)
            self.yamlObjOrder = self._getYamlOrder(contents2)

    def dumps(self):
        """Dump a yaml object as a string."""
        return yaml.dumps(self.yamlObj)

    def dump(self, filename=None):
        """Dump a yaml object to a file."""
        if filename is None and self.yamlFile is None:
            raise Exception("No file to write to.")
        filename = filename if filename is not None else self.yamlFile

